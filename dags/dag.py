from datetime import timedelta, datetime
from dotenv import load_dotenv
from airflow import DAG
from airflow.operators.bash import BashOperator
from airflow.operators.python import PythonOperator
from task.extract_tables import export_tables_to_gcs
from task.load_data import load_data_to_bg

import os

# Load environment variables from a .env file
load_dotenv()

# Default arguments for the DAG
default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime(2024, 7, 11),
    'retries': 1,
    'retry_delay': timedelta(minutes=1),
}

# Define the DAG
dag = DAG(
    'elt_project',
    default_args=default_args,
    description='An airflow DAG for ELT data pipeline',
    schedule_interval=timedelta(days=1), # Schedule interval for the DAG
)

# Fetching environment variables
pg_schema = os.getenv('PG_SCHEMA')
bq_bucket = os.getenv('BQ_BUCKET')
pg_conn_id = os.getenv('PG_CONN_ID')
bq_conn_id = os.getenv('BQ_CONN_ID')
bq_project_id = os.getenv('BQ_PROJECT')
bq_dataset = os.getenv('BQ_DATASET')
dbt_project_path = os.getenv('DBT_PROJECT_PATH')

# List of table names to be processed
table_names =  ['address', 
            'businessentityaddress',
            'countryregion',
            'customer',
            'person', 
            'product', 
            'productcategory', 
            'productsubcategory', 
            'salesorderdetail', 
            'salesorderheader', 
            'salesorderheadersalesreason', 
            'salesreason', 
            'salesterritory', 
            'specialoffer',
            'stateprovince',
            'store']

# Task to export tables from Postgres to GCS
export_tables_task = PythonOperator(
    task_id='export_tables_from_postgres_to_gcs_task',
    python_callable=export_tables_to_gcs,
    op_kwargs={
        'table_names': table_names,
        'pg_schema': pg_schema,
        'bq_bucket': bq_bucket,
        'pg_conn_id': pg_conn_id,
        'bq_conn_id': bq_conn_id,
    },
    dag=dag,
)

# Task to load data from GCS to BigQuery
load_data_task = PythonOperator(
    task_id="load_data_from_gcs_to_bg_task",
    python_callable=load_data_to_bg,
    op_kwargs={
            'table_names' : table_names,
            'bq_bucket' : bq_bucket,
            'bq_conn_id' : bq_conn_id,
            'bq_project_id' : bq_project_id,
            'bq_dataset' : bq_dataset,
    },
    dag=dag,
)

# Task to run DBT models
data_modelling_task = BashOperator(
    task_id= 'dbt_run_task',
    bash_command= f'dbt run --profiles-dir {dbt_project_path} --project-dir {dbt_project_path}',
    dag=dag,
)   

# Define task dependencies
export_tables_task >> load_data_task >> data_modelling_task