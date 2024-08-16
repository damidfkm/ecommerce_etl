# DBT Project for  ECommerce Dataset

This DBT project is designed to transform and model data from the Brazilian E-Commerce dataset, focusing on key analytical questions such as sales by product category, average delivery time, and the number of orders by state.

## Project Structure

The project is organized into three types of models:

1. **Staging Models**: These models serve as a foundation, loading raw data and applying basic transformations.
2. **Intermediate Models**: These models perform aggregations and calculations, preparing data for final analysis.
3. **Final Models**: These models present the data in a format ready for analysis and reporting.

### Directory Structure

ecommerce_etl/
├── macros/
├── models/
│ ├── staging/
│ │ ├── stg_orders.sql
│ │ └── stg_products.sql
│ ├── intermediate/
│ │ ├── int_sales_by_category.sql
│ │ ├── int_avg_delivery_time.sql
│ │ └── int_orders_by_state.sql
│ └── final/
│ ├── fct_sales_by_category.sql
│ ├── fct_avg_delivery_time.sql
│ └── fct_orders_by_state.sql
├── seed
├── snapshots
├── tests
├── sources.yml
├── dbt_project.yml
├── profiles.yml
└── README.md


## Models

### 1. Staging Models

- **stg_orders.sql**:
  - Loads raw orders data and applies necessary transformations.
  - Source: `{{ source('ecommerce', 'orders') }}`

- **stg_products.sql**:
  - Loads raw product data and applies necessary transformations.
  - Source: `{{ source('ecommerce', 'products') }}`

### 2. Intermediate Models

- **int_sales_by_category.sql**:
  - Aggregates sales data by product category.
  - Depends on: `{{ ref('stg_orders') }}`

- **int_avg_delivery_time.sql**:
  - Calculates the average delivery time for each order.
  - Depends on: `{{ ref('stg_orders') }}`

- **int_orders_by_state.sql**:
  - Counts the number of orders per state.
  - Depends on: `{{ ref('stg_orders') }}`

### 3. Final Models

- **fct_sales_by_category.sql**:
  - Presents the final sales by category model.
  - Depends on: `{{ ref('int_sales_by_category') }}`

- **fct_avg_delivery_time.sql**:
  - Presents the final average delivery time model.
  - Depends on: `{{ ref('int_avg_delivery_time') }}`

- **fct_orders_by_state.sql**:
  - Presents the final orders by state model.
  - Depends on: `{{ ref('int_orders_by_state') }}`

## Setup Instructions

1. **Install DBT**:
   Ensure that dbt is installed in your Python environment. You can install it using pip:

```
pip install dbt-bigquery
```
Initialize the Project:
If not already initialized, you can initialize a new dbt project with:

```
dbt init ecommerce_etl
```
2. **Configure DBT**:


3. **Run the Models**:
Execute the dbt models to transform and load the data:

```
dbt run
```
4. **Answer Analytical Questions**:

- Which product categories have the highest sales?:
- Check the results from fct_sales_by_category.sql.
- What is the average delivery time for orders?:
- Check the results from fct_avg_delivery_time.sql.
- Which states have the highest number of orders?:
- Check the results from fct_orders_by_state.sql.

## Notes
Ensure that your dbt project is correctly connected to the BigQuery dataset.
Review the SQL models to make sure they align with your dataset's structure and schema.





