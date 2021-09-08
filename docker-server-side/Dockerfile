FROM oraclelinux:7.9

# environment variables
ENV INSTALL_APEX=true \
    INSTALL_SQLCL=false \
    INSTALL_SQLDEVWEB=false \
    INSTALL_LOGGER=false \
    INSTALL_OOSUTILS=false \
    INSTALL_AOP=false \
    INSTALL_AME=false \
    INSTALL_SWAGGER=false \
    INSTALL_CA_CERTS_WALLET=false \
    DBCA_TOTAL_MEMORY=2048 \
    ORACLE_SID=orcl \
    SERVICE_NAME=orcl \
    DB_INSTALL_VERSION=19 \
    ORACLE_BASE=/u01/app/oracle \
    ORACLE_HOME19=/u01/app/oracle/product/19.0.0/dbhome \
    ORACLE_INVENTORY=/u01/app/oraInventory \
    PASS=oracle \
    ORDS_HOME=/u01/ords \
    JAVA_HOME=/opt/java \
    TOMCAT_HOME=/opt/tomcat \
    APEX_PASS=OrclAPEX1999! \
    APEX_ADDITIONAL_LANG= \
    APEX_PATCH_SET_BUNDLE_FILE= \
    TIME_ZONE=UTC

# copy all scripts
ADD scripts /scripts/

# copy all files
ADD files /files/

# image setup via shell script to reduce layers and optimize final disk usage
RUN /scripts/install_main.sh

# ssh, database and apex port
EXPOSE 22 1521 8080

# use ${ORACLE_BASE} without product subdirectory as data volume
VOLUME ["${ORACLE_BASE}"]

# entrypoint for database creation, startup and graceful shutdown
ENTRYPOINT ["/scripts/entrypoint.sh"]
