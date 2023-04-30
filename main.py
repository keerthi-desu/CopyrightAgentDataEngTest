
# Import packages

import pandas as pd
import numpy as np


def transform_data(df):
    return


def main():
    
    # Import data
    deal_sample = pd.read_csv('data/deal_sample.csv')
    deal_activities_sample = pd.read_csv('data/deal_activities_sample.csv')
    deal_updates_sample = pd.read_csv('data/deal_updates_sample.csv')
    

    transform_data(deal_sample)
    
    print(deal_sample.info())
    print(deal_activities_sample.info())
    print(deal_updates_sample.info())
    print(np.unique(deal_updates_sample["update_type"]))

    return

if __name__ == "__main__":
    main()