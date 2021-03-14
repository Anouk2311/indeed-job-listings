import pandas as pd
import os 
  
# get current directory 
cwd = os.getcwd() 

# parent directory 
parent1 = os.path.dirname(cwd)
parent2 = os.path.dirname(parent1) 

df = pd.read_csv(os.path.join(parent2,
                 'gen/data-preparation/temp/data_merged.csv'),
                  index_col='id')

del df['Unnamed: 0']

df.to_csv(os.path.join(parent2, 'gen/data-preparation/temp/data_cleaned.csv'))


