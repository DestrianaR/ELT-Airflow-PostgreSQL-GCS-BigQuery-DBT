# ELT Bacth Processing for Sales Data Analysis

![Data Architecture](/image/Data_Architecture.jpg)

## Project Overview
In this project I created a batch data processing that handles sales data using PostgreSQL as source database, Google Cloud Storage as Data Bucket, Google Bigqueary as Data Warehouse, dbt as data transformer and displays insights with Power BI. This project shows how various tools work together to stream, store, and analyze data.

Before running this pipeline, you have to install Docker on your computer.

In the first step, you have to clone this project.
```bash
git clone git@github.com:DestrianaR/ELT-Airflow-PostgreSQL-GCS-BigQuery-DBT.git
cd ELT-Airflow-PostgreSQL-GCS-BigQuery-DBT
```

## Create Google Cloud Credential
To let Airflow access BigQuery, first, set up the access credentials.<br>
For further documentation, visit [Create access credentials](https://developers.google.com/workspace/guides/create-credentials).<br>
After that, place the credential file in the `credential` folder and adjust the variable `GOOGLE_APPLICATION_CREDENTIALS` in `.env` with the name of the credential file.

## Run Project
1. Install all requirements in `requirements.txt` file
    ```bash
    pip install -r requirements.txt
    ```
2. Build and start the Docker containers
    ```bash
    docker-compose up -d
    ```
3. Run pyhton script<br>
    Running `load_data_to_pg.py` to load data from local computer to PostgreSQL in docker container.
    ```bash
    python load_data_to_pg.py
    ```
4. Open and start Airflow in your browser.

To stop all container just type this command
```bash
docker-compose down
```

## Dashboard
1. Sales Dashboard Overview
![Dashboard Sales overview](/image/sales_dashboard_page_1.jpg)
<br>
2. Product Sales Performance
![Product Sales Performance](/image/sales_dashboard_page_2.jpg)
<br>
3. Region Sales Performance
![Region Sales Performance](/image/sales_dashboard_page_3.jpg)

