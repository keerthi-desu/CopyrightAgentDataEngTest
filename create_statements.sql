--CREATE DATABASE CopyrightAgent;

DROP TABLE IF EXISTS deal_sample CASCADE;
DROP TABLE IF EXISTS deal_activities_sample CASCADE;
DROP TABLE IF EXISTS deal_updates_sample CASCADE;

--- Creating table deal_sample
CREATE TABLE deal_sample (
    id INT,
    pipeline_id INT,
    user_id VARCHAR NOT NULL,
    Status VARCHAR NOT NULL,
    Value INT NOT NULL,
    Currency VARCHAR NOT NULL,
    Total_activites INT NOT NULL,
    PRIMARY KEY (id)
);

--- Creating table deal_activities_sample
CREATE TABLE deal_activities_sample (
    activity_id INT,
    deal_id INT NOT NULL,
    Type VARCHAR NOT NULL,
    marked_as_done_ts DATE,
    deleted VARCHAR NOT NULL, -- CHECK (deleted = "TRUE" OR deleted = "FALSE")
    PRIMARY KEY (activity_id),
    FOREIGN KEY (deal_id) REFERENCES deal_sample(id)
);

--- Creating table deal_updates_sample
CREATE TABLE deal_updates_sample (
    deal_id INT,
    update_type VARCHAR,
    old_value INT,
    new_value INT,
    PRIMARY KEY (deal_id, update_type, old_value, new_value), -- OR PK (deal_id, old_val, new_val)
    FOREIGN KEY (deal_id) REFERENCES deal_sample(id)
);

COPY deal_sample(id, pipeline_id, user_id, Status, Value, Currency, Total_activites)
FROM 'C:\Users\desus\OneDrive\Desktop\CopyrightAgentDataEngTest\data\deal_sample.csv'
DELIMITER ',' 
CSV HEADER;

SELECT *
FROM deal_sample;