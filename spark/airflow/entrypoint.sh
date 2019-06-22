#!/usr/bin/env bash



case $1 in
    webserver)
        airflow initdb
        airflow scheduler &
        exec airflow webserver --port 5000
        ;;
    *)
        exec $@
        ;;
esac
