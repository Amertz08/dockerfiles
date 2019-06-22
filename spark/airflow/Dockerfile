FROM amertz08/pyspark

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
    libpq-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN python3.6 -m pip install --no-cache-dir \
    apache-airflow[postgres] \
    psycopg2

RUN airflow -h

COPY home/airflow.cfg /root/airflow
COPY home/unittests.cfg /root/airflow
COPY dags/ /root/airflow/dags


EXPOSE 5000

CMD ["airflow", "webserver", "--port", "5000"]
