from datetime import datetime, timedelta

from airflow import DAG
from airflow.contrib.operators.spark_submit_operator import SparkSubmitOperator
from airflow.operators.bash_operator import BashOperator

default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime(2015, 6, 1),
    'email': ['airflow@example.com'],
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
    # 'queue': 'bash_queue',
    # 'pool': 'backfill',
    # 'priority_weight': 10,
    # 'end_date': datetime(2016, 1, 1),
}

dag = DAG("HELLO", default_args=default_args)

t1 = BashOperator(
    task_id='print_date',
    bash_command='date',
    dag=dag
)

spark_conf = {

}

t2 = SparkSubmitOperator(
    task_id="run_spark_job",
    dag=dag,
    application="TEST",
    py_files="find_pi.py"
)

t1 << t2
