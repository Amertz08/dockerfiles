FROM python:3.6

RUN pip install --no-cache \
    apache-airflow[postgres] \
    psycopg2

RUN airflow -h

COPY home/airflow.cfg /root/airflow
COPY home/unittests.cfg /root/airflow
COPY dags/ /root/airflow/dags


EXPOSE 5000

CMD ["airflow", "webserver", "--port", "5000"]
