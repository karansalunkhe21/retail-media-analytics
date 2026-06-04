import duckdb
import pandas as pd

# This tells pandas to show ALL columns, never hide them
pd.set_option('display.max_columns', None)

conn = duckdb.connect()

with open('sql/01_audit/01_first_look.sql', 'r') as f:
    query = f.read()

result = conn.execute(query).df()
print(result)