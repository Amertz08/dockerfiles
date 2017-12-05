# SPARK

Apache Spark image. Comes with python3 and Pyspark

## Args

| ARG | DEFAULT |
|-----|---------|
| SPARK_VERSION | 2.2.0 |
| HADOOP_VERSION | 2.7 |
| SPARK_HOME | /opt/spark |
| SPARK_MASTER_PORT | 7077 |
| SPARK_MASTER_WEBUI_PORT | 8080|
| SPARK_WORKER_PORT | 5000 |
| SPARK_WORKER_WEBUI_PORT | 8081 |

## Install more packages

```Dockefile
FROM amertz08/spark

RUN pip install \
    pandas==0.21.0 \
    arrow==0.10.0
```
