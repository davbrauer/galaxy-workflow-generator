FROM bgruening/galaxy-stable:19.01

MAINTAINER de.STAIR destair@leibniz-fli.de

ENV GALAXY_CONFIG_BRAND="de.STAIR" \
    GALAXY_CONFIG_CONDA_AUTO_INSTALL=True \
    GALAXY_CONFIG_CONDA_AUTO_INIT=True \
    GALAXY_CONFIG_PARALLEL_SLURM_PARAMS="--ntasks=2" \
    GALAXY_CONFIG_PARALLEL_LOCAL_NTASKS=2

COPY tools.yaml $GALAXY_ROOT/tools.yaml
COPY data_managers.yaml $GALAXY_ROOT/data_managers.yaml
COPY job_conf.xml $GALAXY_CONFIG_JOB_CONFIG_FILE

COPY web /tmp/web
COPY workflows /tmp/workflows
COPY atoms /tmp/atoms
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
