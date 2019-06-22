#!/bin/bash

CLASS=org.apache.spark.deploy

usage () {
  echo "USAGE"
  echo "shell <MASTER_HOST> : run Spark shell"
  echo "py <MASTER_HOST> : run pyspark"
  echo "master : run master node"
  echo "slave <MASTER_HOST>  : run slave node"
}

load_config () {
    . $SPARK_HOME/sbin/spark-config.sh
    . $SPARK_HOME/bin/load-spark-env.sh
}

run_shell () {
    spark-shell --master spark://$1:$SPARK_MASTER_PORT
}

run_py () {
    pyspark --master spark://$1:$SPARK_MASTER_PORT
}

run_master () {
    load_config
    $SPARK_HOME/bin/spark-class $CLASS.master.Master \
    -h $(hostname) --port $SPARK_MASTER_PORT \
    --webui-port $SPARK_MASTER_WEBUI_PORT
}

run_worker () {
    load_config
    $SPARK_HOME/bin/spark-class $CLASS.worker.Worker \
    --webui-port $SPARK_WORKER_WEBUI_PORT $1:$SPARK_MASTER_PORT
}

case $1 in
  (shell)
    run_shell $2
    ;;
  (py)
    run_py $2
    ;;
  (master)
    run_master
    ;;
  (worker)
    run_worker $2
    ;;
  (*)
    usage
    ;;
esac
