# Galaxy - de.STAIR
# git clone --recursive https://github.com/destairdenbi/galaxy-guided-rna-seq.git
# cd galaxy-guided-rna-seq
# docker build -t destairdenbi/galaxy-guided-rna-seq:17.05 .
# docker run -d -p 8080:80 -v ~/galaxy-guided-rna-seq_DB:/export destairdenbi/galaxy-guided-rna-seq:17.05
# troubleshoot: --net host

FROM bgruening/galaxy-stable:17.05

MAINTAINER de.STAIR destair@leibniz-fli.de

ENV GALAXY_CONFIG_BRAND="RNA-Seq" \
    GALAXY_CONFIG_CONDA_AUTO_INSTALL=True \
    GALAXY_CONFIG_CONDA_AUTO_INIT=True

COPY tools.yaml $GALAXY_ROOT/tools.yaml
COPY tools.yaml.lock $GALAXY_ROOT/tools.yaml.lock
COPY data_managers.yaml $GALAXY_ROOT/data_managers.yaml
COPY workflows /tmp/workflows
COPY guided_tours /tmp/guided_tours
COPY webhooks /tmp/webhooks
COPY web $GALAXY_CONFIG_DIR/web
        
RUN install-tools $GALAXY_ROOT/tools.yaml && \
    $GALAXY_CONDA_PREFIX/bin/conda clean --tarballs --yes > /dev/null && \
    rm -rf /export/galaxy-central/

RUN startup_lite && \
    galaxy-wait && \
    run-data-managers --config $GALAXY_ROOT/data_managers.yaml -g http://localhost:8080 -u $GALAXY_DEFAULT_ADMIN_USER -p $GALAXY_DEFAULT_ADMIN_PASSWORD --api_key $GALAXY_DEFAULT_ADMIN_KEY && \
    workflow-install --workflow_path /tmp/workflows/ -g http://localhost:8080 -u $GALAXY_DEFAULT_ADMIN_USER -p $GALAXY_DEFAULT_ADMIN_PASSWORD --api_key $GALAXY_DEFAULT_ADMIN_KEY && \
    rm -rf /tmp/workflows

RUN sed -i -r 's/(^\s*)#+(\s*require_login\s*=\s*).*/\1\2True/' $GALAXY_CONFIG_FILE && \
    sed -i -r 's/(^\s*)#+(\s*brand\s*=\s*).*/\1\2de\.STAIR/' $GALAXY_CONFIG_FILE && \
    sed -i -r 's/(^\s*)#+(\s*enable_quotas\s*=\s*).*/\1\2True/' $GALAXY_CONFIG_FILE && \
    sed -i -r 's/(^\s*)#+(\s*show_welcome_with_login\s*=\s*).*/\1\2True/' $GALAXY_CONFIG_FILE && \
    mv /tmp/webhooks/switchtour $GALAXY_ROOT/config/plugins/webhooks && \
    rm -rf /tmp/webhooks && \
    mv /tmp/guided_tours/*yaml $GALAXY_ROOT/config/plugins/tours/ && \
    rm -rf /tmp/guided_tours
 