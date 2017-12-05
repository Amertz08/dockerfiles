#!/bin/bash

usage () {
  echo "USAGE"
  echo "py : run pyspark"
  echo "master : run master node"
  echo "slave <MASTER_HOST_IP/NAME>:<PORT> : run slave node"
}

case $1 in
  (py)
    pyspark
    ;;
  (master)
    echo "master"
    $SPARK_HOME/sbin/start-master.sh &
    ;;
  (slave)
    echo "slave"
    $SPARK_HOME/sbin/start-slave.sh $2 &
    ;;
  (*)
    usage
    ;;
esac
