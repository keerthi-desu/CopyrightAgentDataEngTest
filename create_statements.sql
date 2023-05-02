-- Create a new database for the tables: createdb -U postgres copyrightagent
-- If database already exists, delete it (if not important) using: dropdb -U postgres copyrightagent
-- Ctrl + A and run the the script!

DROP TABLE IF EXISTS deal_sample CASCADE;
DROP TABLE IF EXISTS deal_activities_sample CASCADE;
DROP TABLE IF EXISTS deal_updates_sample CASCADE;

--- Creating table deal_sample
CREATE TABLE deal_sample (
    id INT,
    pipeline_id INT NOT NULL,
    user_id VARCHAR NOT NULL,
    Status VARCHAR NOT NULL,
    Value FLOAT NOT NULL,
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
    deleted BOOLEAN NOT NULL,
    PRIMARY KEY (activity_id),
    FOREIGN KEY (deal_id) REFERENCES deal_sample(id)
);

--- Creating table deal_updates_sample
CREATE TABLE deal_updates_sample (
    deal_id INT,
    update_type VARCHAR,
    old_value VARCHAR,
    new_value VARCHAR,
    --PRIMARY KEY (deal_id, update_type, new_value, old_value) OR PK (deal_id, old_val, new_val)
    FOREIGN KEY (deal_id) REFERENCES deal_sample(id)
);


-- To load data into the tables, access PostgreSQL using the terminal by executing this command: psql -U postgres -q copyrightagent

-- After connecting to PostgreSQL, copy and paste the following commands
\copy deal_sample from 'data\transformed_DS.csv' delimiter ',' csv header;
\copy deal_activities_sample from 'data\deal_activities_sample.csv' delimiter ',' csv header;
\copy deal_updates_sample from 'data\transformed_DUS.csv' delimiter ',' csv header;