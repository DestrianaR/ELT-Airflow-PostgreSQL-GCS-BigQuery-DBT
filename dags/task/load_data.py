from airflow.providers.google.cloud.transfers.gcs_to_bigquery import GCSToBigQueryOperator

# Function to load data from Google Cloud Storage (GCS) to BigQuery
def load_data_to_bg(**kwargs):
    table_names = kwargs['table_names']
    bq_bucket = kwargs['bq_bucket']
    bq_conn_id = kwargs['bq_conn_id']
    bq_project_id = kwargs['bq_project_id']
    bq_dataset = kwargs['bq_dataset']
    dag = kwargs['dag']

    for table_name in table_names:
        load_data_and_schema_task = GCSToBigQueryOperator(
            task_id=f"load_data_{table_name}_from_gcs_to_bg_task",
            bucket=f"{bq_bucket}",
            source_objects=[f'{table_name}.parquet'],
            source_format="PARQUET",
            destination_project_dataset_table=f"{bq_project_id}.{bq_dataset}.{table_name}",
            write_disposition="WRITE_TRUNCATE", # Overwrite the table data
            gcp_conn_id=bq_conn_id,
            dag=dag,
        )
        # Execute the task
        load_data_and_schema_task.execute(context=kwargs)