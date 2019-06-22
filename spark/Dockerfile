FROM ubuntu:16.04

# Install prereqs
RUN apt-get update && \
    apt-get install --no-install-recommends -y \
    wget \
    default-jdk \
    scala \
    && rm -rf /var/lib/apt/lists/*

ENV SPARK_VERSION=2.3.3
ENV HADOOP_VERSION=2.7
ENV SPARK_HOME=/opt/spark
ENV PATH=$SPARK_HOME/bin:$PATH

ENV SPARK_MASTER_PORT=7077
ENV SPARK_MASTER_WEBUI_PORT=8080
ENV SPARK_WORKER_PORT=5000
ENV SPARK_WORKER_WEBUI_PORT=8081

# Install spark
RUN wget http://apache.claz.org/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz && \
    tar -xzf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz && \
    rm spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz && \
    mv spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} /opt/spark-${SPARK_VERSION}
RUN ln -s /opt/spark-${SPARK_VERSION} $SPARK_HOME

COPY runner.sh /usr/local/bin/runner

CMD ["spark-shell"]
