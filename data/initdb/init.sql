CREATE DATABASE "AdventureWorks2019";
CREATE USER postgres WITH PASSWORD 'postgres';
GRANT ALL PRIVILEGES ON DATABASE "AdventureWorks2019" TO postgres;
-- PostgreSQL 15 requires additional privileges:
GRANT ALL ON SCHEMA public TO postgres;
