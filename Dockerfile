# Galaxy - de.STAIR
# docker build -t destair/galaxy-stable:17.05 .
# docker run --net host -d -p 8080:80 -v ~/dockerdata:/export destair/v1

FROM bgruening/galaxy-stable:17.05

MAINTAINER de.STAIR destair@leibniz-fli.de

ENV GALAXY_CONFIG_BRAND="RNA-Seq" \
    GALAXY_CONFIG_CONDA_AUTO_INSTALL=True \
    GALAXY_CONFIG_CONDA_AUTO_INIT=True

COPY tools.yaml $GALAXY_ROOT/tools.yaml

RUN install-tools $GALAXY_ROOT/tools.yaml && \
    $GALAXY_CONDA_PREFIX/bin/conda clean --tarballs --yes > /dev/null && \
    rm -rf /export/galaxy-central/

RUN startup_lite && \
    galaxy-wait && \
    git clone https://github.com/destairdenbi/workflows.git /tmp/workflows && \
    workflow-install --workflow_path /tmp/workflows/ -g http://localhost:8080 -u $GALAXY_DEFAULT_ADMIN_USER -p $GALAXY_DEFAULT_ADMIN_PASSWORD && \
    rm -rf /tmp/workflows

RUN echo "destair is coming" > $GALAXY_CONFIG_WELCOME_URL && \
    git clone https://github.com/destairdenbi/webhooks.git /tmp/webhooks && \
    mv /tmp/webhooks/switchtour $GALAXY_ROOT/config/plugins/webhooks && \
    rm -rf /tmp/webhooks && \
    git clone https://github.com/destairdenbi/guided_tours.git /tmp/guided_tours && \
    mv /tmp/guided_tours/*yaml $GALAXY_ROOT/config/plugins/tours/ && \
    rm -rf /tmp/guided_tours
 
