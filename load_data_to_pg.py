from sqlalchemy import create_engine, text
import pandas as pd


engine = create_engine(f'postgresql://postgres:postgres@localhost/AdventureWorks2019')
schema_name = "sales"

# Create new schema if not exists
with engine.connect() as connection:
    connection.execute(text(f"CREATE SCHEMA IF NOT EXISTS {schema_name}"))
    
# List of table names to be processed
csv_name = ['address', 
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
            'stateprovince']

for name in csv_name:
    csv_path = f"./data/dataset/{name}.csv"
    df = pd.read_csv(csv_path, sep=';')
    df.to_sql(name, engine, schema=schema_name, if_exists='replace', index=False)
