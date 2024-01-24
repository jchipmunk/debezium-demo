ARG DEBEZIUM_VERSION
FROM quay.io/debezium/connect:${DEBEZIUM_VERSION}

ARG JMX_AGENT_VERSION=0.20.0
ARG METRICS_PORT=8082
RUN curl -so ${KAFKA_HOME}/libs/jmx_prometheus_javaagent.jar \
    https://repo.maven.apache.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/${JMX_AGENT_VERSION}/jmx_prometheus_javaagent-${JMX_AGENT_VERSION}.jar
COPY --chown=kafka:kafka config/kafka-connect.yml ${KAFKA_HOME}/config/kafka-connect.yml
ENV KAFKA_OPTS="-javaagent:$KAFKA_HOME/libs/jmx_prometheus_javaagent.jar=$METRICS_PORT:$KAFKA_HOME/config/kafka-connect.yml"
