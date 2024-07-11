from airflow.providers.google.cloud.transfers.postgres_to_gcs import PostgresToGCSOperator

# Function to export tables from PostgreSQL to Google Cloud Storage
def export_tables_to_gcs(**kwargs):
    table_names = kwargs['table_names']
    pg_schema = kwargs['pg_schema']
    bq_bucket = kwargs['bq_bucket']
    pg_conn_id = kwargs['pg_conn_id']
    bq_conn_id = kwargs['bq_conn_id']
    dag = kwargs['dag']

    for table_name in table_names:
        sql_query = f'SELECT * FROM {pg_schema}."{table_name}";'
        export_filename = f'{table_name}.parquet'

        postgres_to_gcs = PostgresToGCSOperator(
            task_id=f'postgres_to_gcs_{table_name}',
            sql=sql_query,
            bucket=bq_bucket,
            filename=export_filename,
            export_format='PARQUET',
            postgres_conn_id=pg_conn_id,
            gzip=False,
            gcp_conn_id=bq_conn_id,
            dag=dag,
        )
        # Execute the task
        postgres_to_gcs.execute(context=kwargs)