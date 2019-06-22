FROM amertz08/pyspark

ENV AIRFLOW__CORE__LOAD_EXAMPLES=False
ENV AIRFLOW__CORE__DAGS_FOLDER=/code
ENV AIRFLOW__CORE__LOGGING_LEVEL=DEBUG
ENV AIRFLOW__CORE__EXECUTOR=LocalExecutor
ENV AIRFLOW__CORE__SQL_ALCHEMY_CONN=postgresql+psycopg2://airflow:pass@db:5432/airflow
ENV AIRFLOW__CORE__DEFAULT_TIMEZONE=America/Central
ENV AIRFLOW__SCHEDULER__CATCHUP_BY_DEFAULT=False

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
    libpq-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN python3.6 -m pip install --no-cache-dir \
    apache-airflow[postgres] \
    psycopg2

COPY entrypoint.sh .
RUN mkdir /code
WORKDIR /code
COPY dags/ .


EXPOSE 5000

ENTRYPOINT ["/entrypoint.sh"]

CMD ["webserver"]
