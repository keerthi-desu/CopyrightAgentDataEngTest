import pandas as pd
import numpy as np


def main():
    
    ## Import data
    deal_sample = pd.read_csv('data/deal_sample.csv')
    deal_activities_sample = pd.read_csv('data/deal_activities_sample.csv')
    deal_updates_sample = pd.read_csv('data/deal_updates_sample.csv')

    #print(deal_sample.info())
    #print(deal_activities_sample.info())
    #print(deal_updates_sample.info())
    
    ## Drop duplicates in DUS (in an attempt to normalize it)
    transformed_DUS = deal_updates_sample.drop_duplicates()
    transformed_DUS.to_csv("data/transformed_DUS.csv", index=False)

    ## Marking deals that have neither activities nor updates as inactive
    DS = deal_sample.copy()
    for id in DS["id"]:
        if id not in np.unique(deal_activities_sample["deal_id"]) and id not in np.unique(transformed_DUS["deal_id"]):
            DS.loc[DS["id"] == id, "Status"] = "Unknown"
    DS.to_csv("data/transformed_DS.csv", index=False)

    return

if __name__ == "__main__":
    main()