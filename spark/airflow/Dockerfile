FROM amertz08/pyspark

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
    libpq-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN python3.6 -m pip install --no-cache-dir \
    apache-airflow[postgres,celery] \
    psycopg2

COPY entrypoint.sh .
RUN mkdir /code
WORKDIR /code
COPY dags/ .

ENV AIRFLOW__CORE__LOAD_EXAMPLES=False
ENV AIRFLOW__CORE__DAGS_FOLDER=/code
ENV AIRFLOW__CORE__LOGGING_LEVEL=DEBUG
ENV AIRFLOW__CORE__EXECUTOR=CeleryExecutor
ENV AIRFLOW__CORE__SQL_ALCHEMY_CONN=postgresql+psycopg2://airflow:pass@db:5432/airflow
ENV AIRFLOW__CORE__DEFAULT_TIMEZONE=America/Central
ENV AIRFLOW__SCHEDULER__CATCHUP_BY_DEFAULT=False
ENV AIRFLOW__CELERY__BROKER_URL=amqp://guest:guest@broker:5672/
ENV AIRFLOW__CELERY__RESULT_BACKEND=db+postgresql://airflow:pass@db:5432/airflow

# webserver UI, flower, celery worker log port
EXPOSE 5000 5555 8793

ENTRYPOINT ["/entrypoint.sh"]

CMD ["webserver"]
