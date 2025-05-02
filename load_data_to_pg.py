import pandas as pd
import logging
from sqlalchemy import create_engine, text
from sqlalchemy.exc import SQLAlchemyError

# Setup logging
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s"
)

# Connection config
try:
    engine = create_engine("postgresql://postgres:postgres@localhost:5432/AdventureWorks2019")
    connection = engine.connect()
    logging.info("Database connection successful.")
except SQLAlchemyError as e:
    logging.error(f"Database connection failed: {e}")
    raise

schema_name = "sales"

# Create schema if not exists
try:
    with engine.connect() as connection:
        connection.execute(text(f"CREATE SCHEMA IF NOT EXISTS {schema_name}"))
        logging.info(f"Schema '{schema_name}' checked/created.")
except SQLAlchemyError as e:
    logging.error(f"Error creating schema: {e}")
    raise

# CSV files to load
csv_name = [
    'address', 'businessentityaddress', 'countryregion', 'customer', 'person',
    'product', 'productcategory', 'productsubcategory', 'salesorderdetail',
    'salesorderheader', 'salesorderheadersalesreason', 'salesreason',
    'salesterritory', 'specialoffer', 'stateprovince', 'store'
]

# Load each CSV into PostgreSQL
for name in csv_name:
    csv_path = f"./data/dataset/{name}.csv"
    try:
        df = pd.read_csv(csv_path, sep=';')
        df.to_sql(name, engine, schema=schema_name, if_exists='replace', index=False)
        logging.info(f"Successfully imported '{name}.csv' into schema '{schema_name}'.")
    except Exception as e:
        logging.error(f"Failed to import '{name}.csv': {e}")
