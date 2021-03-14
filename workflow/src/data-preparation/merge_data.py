import pandas as pd
import os 
  
# get current directory 
cwd = os.getcwd() 

# parent directory 
parent1 = os.path.dirname(cwd)
parent2 = os.path.dirname(parent1) 

df1 = pd.read_csv(os.path.join(parent2,
                 'gen/data-preparation/input/postings_13.03.21.csv'),
                  index_col='id')

df2 = pd.read_csv(os.path.join(parent2,
                 'gen/data-preparation/input/descriptions_13.03.21.csv'),
                  index_col='id')

df_merged = pd.concat([df1, df2], axis=1)

df_merged.to_csv(os.path.join(parent2, 'gen/data-preparation/temp/data_merged.csv'))