# Data Engineering code challenge

## How to run the code

- Run the python script `main.py`
- Create a new database (if necessary) using the anaconda prompt by running the following command: `createdb -U postgres copyrightagent`
	- If a database already exists with the given name, then change the name from `copyrightagent` to something else.
- Access PostgreSQL using the prompt by executing the following command: `psql -U postgres -q copyrightagent`
- Run the `create_statements.sql` after connecting to the right database to create tables filled with data
	- It is important that we run it via terminal else copying the data into tables process would throw us an error
- After everything runs smoothly, run the `transformations.sql` either all at once or one query at a time!


## Discussion points

- What conclusions can be drawn about the quality of the data sets?
	- `deal_updates_sample.csv` is not properly maintained as it contains duplicates and null values.
- How could a pipeline be set up to regularly update the database from the CRM system?
- How can the data be structured to accommodate future requests on the same underlying datasets?
	- Using triggers to check whether input is valid before updating tables.
- Which other relevant information could be retrieved from these data sets, if any?
	- Count of different types of activities performed for each deal that is not deleted.
	- The most singular type of activities performed for a deal are emails (63) but this is on a deal whose status is "open".
	- The average number of activities performed on deals won are 5 (rounded to the nearest integer).