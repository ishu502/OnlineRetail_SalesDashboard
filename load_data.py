import pandas as pd
from sqlalchemy import create_engine

# 1. CSV file path — NO SPACES in filename or path
csv_file = 'C:/Users/iswarya/Downloads/onlineretail.csv'

# 2. Read CSV (with InvoiceDate parsed properly)
df = pd.read_csv(csv_file, parse_dates=['InvoiceDate'], dayfirst=True)

# 3. MySQL connection (replace your actual MySQL password here)
engine = create_engine('mysql+mysqlconnector://root:yourpassword@localhost:3306/salesdb')

# 4. Upload to MySQL — replacing the table if it already exists
try:
    print("🚀 Uploading to MySQL table 'onlineretail'...")
    df.to_sql(name='onlineretail', con=engine, if_exists='replace', index=False, chunksize=1000)
    print("✅ Upload successful! Table created/replaced.")
except Exception as e:
    print("❌ Upload failed:", e)
