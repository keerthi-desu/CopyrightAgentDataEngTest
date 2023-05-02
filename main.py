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
    
    ## Drop duplicates in DUS (in an attempt to normalize it) BUT can also be handled by creating a trigger
    try:
        transformed_DUS = deal_updates_sample.drop_duplicates()
        transformed_DUS.to_csv("data/transformed_DUS.csv", index=False)
        print("Finished removing duplicates.")
    except:
        print("Unable to drop duplicates :((")

    ## Marking deals that have neither activities nor updates as inactive
    try:
        DS = deal_sample.copy()
        for id in DS["id"]:
            if id not in np.unique(deal_activities_sample["deal_id"]) and id not in np.unique(transformed_DUS["deal_id"]):
                DS.loc[DS["id"] == id, "Status"] = "Unknown"
        DS.to_csv("data/transformed_DS.csv", index=False)
        print("Marked respective deals as inactive.")
    except:
        print("Unable to mark deals as inactive :((")
    
    return

if __name__ == "__main__":
    main()