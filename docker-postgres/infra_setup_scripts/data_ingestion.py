import pandas as pd
from sqlalchemy import create_engine
import os

# Database connection details
db_user = 'postgres'
db_password = 'postgres'
db_host = 'localhost'
db_port = '5432'
db_name = 'ecommerce'

# Connect to the PostgreSQL database
engine = create_engine(f'postgresql://{db_user}:{db_password}@{db_host}:{db_port}/{db_name}')

# Define the base directory for the data files
base_dir = r'C:\Users\T2\OneDrive\Documents\Capstone\ecommerce_etl\data'

# Print the base directory to debug
print(f"Base directory for data files: {base_dir}")

# Load and ingest each dataset
customers_file = os.path.join(base_dir, 'olist_customers_dataset.csv')
print(f"Loading file: {customers_file}")
df_customers = pd.read_csv(customers_file)
df_customers.to_sql('olist_customers', engine, if_exists='replace', index=False)

geolocation_file = os.path.join(base_dir, 'olist_geolocation_dataset.csv')
print(f"Loading file: {geolocation_file}")
df_geolocation = pd.read_csv(geolocation_file)
df_geolocation.to_sql('olist_geolocation', engine, if_exists='replace', index=False)

items_file = os.path.join(base_dir, 'olist_order_items_dataset.csv')
print(f"Loading file: {items_file}")
df_items = pd.read_csv(items_file)
df_items.to_sql('olist_order_items', engine, if_exists='replace', index=False)

payments_file = os.path.join(base_dir, 'olist_order_payments_dataset.csv')
print(f"Loading file: {payments_file}")
df_payments = pd.read_csv(payments_file)
df_payments.to_sql('olist_order_payments', engine, if_exists='replace', index=False)

orders_file = os.path.join(base_dir, 'olist_orders_dataset.csv')
print(f"Loading file: {orders_file}")
df_orders = pd.read_csv(orders_file)
df_orders.to_sql('olist_orders', engine, if_exists='replace', index=False)

reviews_file = os.path.join(base_dir, 'olist_order_reviews_dataset.csv')
print(f"Loading file: {reviews_file}")
df_reviews = pd.read_csv(reviews_file)
df_reviews.to_sql('olist_order_reviews', engine, if_exists='replace', index=False)

products_file = os.path.join(base_dir, 'olist_products_dataset.csv')
print(f"Loading file: {products_file}")
df_products = pd.read_csv(products_file)
df_products.to_sql('olist_products', engine, if_exists='replace', index=False)

sellers_file = os.path.join(base_dir, 'olist_sellers_dataset.csv')
print(f"Loading file: {sellers_file}")
df_sellers = pd.read_csv(sellers_file)
df_sellers.to_sql('olist_sellers', engine, if_exists='replace', index=False)

category_file = os.path.join(base_dir, 'product_category_name_translation.csv')
print(f"Loading file: {category_file}")
df_category = pd.read_csv(category_file)
df_category.to_sql('product_category_name_translation', engine, if_exists='replace', index=False)