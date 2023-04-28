
# Import packages

#https://www.linkedin.com/pulse/two-simple-ways-upload-csv-files-directly-postgresql-database-mishra/
from sqlalchemy import create_engine
import pandas as pd

# Import data
engine = create_engine("postgresql+psycopg2://postgres:srde@localhost:5432/postgres")
df = pd.read_csv('data/deal_sample.csv')

try:
    df.to_sql('deal_sample', engine, if_exists= 'replace', index= False)
    print("Done")

except:
    print("Sorry, some error has occurred!")

finally:
    engine.dispose()

# Transform