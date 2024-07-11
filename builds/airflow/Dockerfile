FROM apache/airflow:2.9.2

# Switch to the airflow user
USER airflow

# Copy requirements file and install dependencies
COPY requirements.txt /requirements.txt
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r /requirements.txt
RUN pip install apache-airflow-providers-google dbt-bigquery

COPY ./airflow_dbt /opt/airflow/airflow_dbt

WORKDIR /opt/airflow/airflow_dbt

USER root

RUN dbt deps

USER airflow




