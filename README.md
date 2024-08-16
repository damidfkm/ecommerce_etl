# ecommerce_etl altschool_de_capstone

# Project Overview
This project aims to build an end-to-end Extract, Transform, Load (ETL) pipeline for analyzing the Brazilian E-Commerce dataset. The pipeline is built using a combination of Apache Airflow, Docker, PostgreSQL, dbt, and BigQuery. The goal is to automate the data ingestion, transformation, and analytical reporting processes. 

# Project Structure

# 1. Apache Airflow

Apache Airflow is used for orchestrating the ETL pipeline. Airflow allows the scheduling and monitoring of the data workflow, ensuring that each step is executed in the correct order and managing dependencies between tasks.

## Key Components:
- DAGs (Directed Acyclic Graphs): Defines the ETL workflow, including task dependencies and scheduling.
- Tasks: Individual steps in the workflow, such as data extraction, transformation, and loading.

## Setup:
- Dockerfile:
Used to build the Airflow environment with all necessary dependencies.
- dags/:
Contains the Airflow DAGs that define the ETL workflow.

- Command to initialize Airflow:
```
docker-compose up -d
```
# 2. PostgreSQL

PostgreSQL is used as the initial staging database where raw data is ingested. The data is stored here before being transformed and loaded into BigQuery.

## Key Components:

- PostgreSQL Container:
Hosts the database where the raw data is stored.

- Setup:
-Docker Compose:
Sets up the PostgreSQL database container.
- Database Initialization:
Data tables are created and populated using SQL scripts.

- Command to access PostgreSQL:

```
docker exec -it <container_id> psql -U <username> -d <database>
```

# 3. DBT (Data Build Tool)

DBT is used for transforming and modeling data in BigQuery. dbt allows you to create models that transform raw data into a clean and usable format, which can then be used to generate reports and analytics.
 
## Key Components:
- Models:
SQL files that define the transformations applied to the data.
Organized into staging, intermediate, and final models.
- dbt Project:
Configuration files that define the dbt project structure and connection to BigQuery.

- Setup:
- dbt Initialization:
Initialize a new dbt project using dbt init <project_name>.
- dbt Models:
Create models for staging, intermediate, and final transformations.
- dbt Run:
Execute the models using ``dbt run``.

# 4. BigQuery
BigQuery is the final destination for the transformed data. The clean and aggregated data is stored here, allowing for efficient querying and analysis.

## Key Components:
- Dataset:
The dataset in BigQuery where the transformed data is stored.
- Tables:
Tables within the dataset that store the final, transformed data.

- Setup:
- BigQuery Connection:
Configure dbt to connect to your BigQuery dataset using service account credentials.
- Data Loading:
Load the transformed data into BigQuery using dbt.

# 5. Analytical Questions
The project aims to answer the following analytical questions:

1. Which product categories have the highest sales?
Model: Aggregates sales data by product category.
SQL: int_sales_by_category.sql
2. What is the average delivery time for orders?
Model: Calculates the time difference between order purchase and delivery.
SQL: int_avg_delivery_time.sql
3. Which states have the highest number of orders?
Model: Counts the number of orders per state.
SQL: int_orders_by_state.sql

# 6. Docker Compose
The entire project is containerized using Docker Compose, which orchestrates the setup of the Airflow, PostgreSQL, and other necessary services.

## Key Components:
- ``docker-compose.yml``:
Defines the services, networks, and volumes used in the project.
- Services:
- Includes containers for Airflow, PostgreSQL, and any other necessary tools.
- Command to bring up the entire stack:
```
docker-compose up -d
```

# 7. Requirements
The project dependencies are listed in the requirements.txt file. These include all the necessary Python packages for Airflow, dbt, PostgreSQL, and other utilities.

``Installation``:
- To install all dependencies, use the following command:

```
pip install -r requirements.txt
```

# 8. Running the ETL Pipeline
To run the ETL pipeline, follow these steps:

- Bring up the Docker containers:
```
docker-compose up -d
```
- Trigger the Airflow DAG:
Access the Airflow web UI and manually trigger the DAG.
Monitor the DAG’s execution to ensure all tasks are completed.

- Run dbt models:
```
dbt run
```

- Query the transformed data in BigQuery:
Use SQL to query the final tables in BigQuery to answer the analytical questions.

