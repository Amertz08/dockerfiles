#!/usr/bin/env bash

case $1 in
    webserver)
        airflow initdb
        exec airflow webserver --port 5000
        ;;
    worker|scheduler|flower)
        sleep 10
        exec airflow $@
        ;;
    *)
        exec $@
        ;;
esac
