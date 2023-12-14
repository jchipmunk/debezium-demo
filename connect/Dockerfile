ARG DEBEZIUM_VERSION
FROM quay.io/debezium/connect:${DEBEZIUM_VERSION}

ENV MAVEN_DEP_DESTINATION=${KAFKA_HOME}/libs \
    ORACLE_JDBC_VERSION="21.6.0.0" \
    ORACLE_JDBC_MD5=312e6f4ec9932bbf74a4461669970c4b
RUN docker-maven-download central com/oracle/database/jdbc ojdbc8 "$ORACLE_JDBC_VERSION" "$ORACLE_JDBC_MD5"

ARG JMX_AGENT_VERSION=0.20.0
ARG METRICS_PORT=8082
RUN curl -so ${KAFKA_HOME}/libs/jmx_prometheus_javaagent.jar \
    https://repo.maven.apache.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/${JMX_AGENT_VERSION}/jmx_prometheus_javaagent-${JMX_AGENT_VERSION}.jar
COPY --chown=kafka:kafka kafka-connect.yml ${KAFKA_HOME}/config/kafka-connect.yml
ENV KAFKA_OPTS="-javaagent:$KAFKA_HOME/libs/jmx_prometheus_javaagent.jar=$METRICS_PORT:$KAFKA_HOME/config/kafka-connect.yml"
