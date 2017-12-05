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

## Running

```
$ docker run -p 8080:8080 -p 6000:8081 -P -it spark bash
root@c42d33c3ee09:/# master
starting org.apache.spark.deploy.master.Master, logging to /opt/spark/logs/spark--org.apache.spark.deploy.master.Master-1-c42d33c3ee09.out
root@c42d33c3ee09:/# slave $(hostname):$SPARK_MASTER_PORT
starting org.apache.spark.deploy.worker.Worker, logging to /opt/spark/logs/spark--org.apache.spark.deploy.worker.Worker-1-c42d33c3ee09.out
```
