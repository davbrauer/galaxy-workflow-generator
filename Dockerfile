FROM bgruening/galaxy-stable:19.01

MAINTAINER de.STAIR destair@leibniz-fli.de

ENV GALAXY_CONFIG_BRAND="RNA-Seq" \
    GALAXY_CONFIG_CONDA_AUTO_INSTALL=True \
    GALAXY_CONFIG_CONDA_AUTO_INIT=True

COPY tools.yaml $GALAXY_ROOT/tools.yaml
COPY data_managers.yaml $GALAXY_ROOT/data_managers.yaml
COPY web $GALAXY_CONFIG_DIR/web
COPY job_conf.xml $GALAXY_CONFIG_JOB_CONFIG_FILE

COPY workflows /tmp/workflows
COPY guided_tours /tmp/guided_tours
COPY webhooks /tmp/webhooks
COPY tools /tmp/tools
COPY setup.sh /tmp/setup.sh

RUN install-tools $GALAXY_ROOT/tools.yaml && \
    $GALAXY_CONDA_PREFIX/bin/conda clean -y --all > /dev/null && \
    rm -rf /export/galaxy-central/

RUN startup_lite && \
    galaxy-wait && \
    run-data-managers --config $GALAXY_ROOT/data_managers.yaml -g http://localhost:8080 -u $GALAXY_DEFAULT_ADMIN_USER -p $GALAXY_DEFAULT_ADMIN_PASSWORD --api_key $GALAXY_DEFAULT_ADMIN_KEY && \
    workflow-install --workflow_path /tmp/workflows/ -g http://localhost:8080 -u $GALAXY_DEFAULT_ADMIN_USER -p $GALAXY_DEFAULT_ADMIN_PASSWORD --api_key $GALAXY_DEFAULT_ADMIN_KEY && \
    rm -rf /tmp/workflows

RUN bash /tmp/setup.sh
