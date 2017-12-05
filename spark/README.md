# SPARK

Apache Spark image. Comes with python3 and Pyspark

## Args

| ARG | DEFAULT |
|-----|---------|
| SPARK_VERSION | 2.2.0 |
| HADOOP_VERSION | 2.7 |
| SPARK_HOME | /opt/spark |

## Install more packages

```Dockefile
FROM amertz08/spark

RUN pip install \
    pandas==0.21.0 \
    arrow==0.10.0
```
