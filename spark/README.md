# SPARK

Apache Spark image. Comes with python3 and Pyspark

## Args & Envs

| ARG | DEFAULT |
|-|-|
| SPARK_VERSION | 2.2.0 |
| HADOOP_VERSION | 2.7 |
| SPARK_HOME | /opt/spark |

| ENV | DEFAULT |
|-|-|
| SPARK_MASTER_PORT | 7077 |
| SPARK_MASTER_WEBUI_PORT | 8080 |
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

Standard Docker CLI

```bash
$ docker network create spark-cluster

$ docker run -d \
    -e LOG_FILE=spark-master-log.out
    -p 8080:8080 \ # Web UI
    -p 7077:7077 \ # Master Port
    -p 6066:6066 \ # Rest API
    --name spark-master \
    --network spark-cluster \
    spark runner master

// This can be ran multiple times to create multiple nodes
$ docker run -d \
    -e LOG_FILE=spark-worker-log.out
    -p 8081 \ # Map 8081 to random
    -p 5000 \ # Map 5000 to random
    --network spark-cluster \
    spark runner worker spark-master

// Run PySpark
$ docker run -it \
    -p 4040:4040 \ # Web UI
    --network spark-cluster \
    spark runner py spark-master
```

Docker Compose

```bash
$ docker-compose up --build -d --scale worker=2  # Any amount of desired workers
```

## TODO
- Security

