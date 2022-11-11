# End-to-End testing of the Littil platform

## Running the docker-compose environment

## Building the database

in the `db` directory resides the `Dockerfile` and necessary create scripts. 
The `1_schema.sql` script is generated with the `mysqldump`. It should not be necessary to make manual edits to this file.
In the `data.sql` you can insert any necessary DML to populate the tables. Do not include any DDL, as this will not be present in the production db.
These files are picked up by the database initialization script in the docker image and run in order by their name, hence the numeric prefix.

### Multi-stage build
The `Dockerfile` is set up as a multi-stage build that first populates the db and saves the content in a custom data directory. In a second stage, the entire content is copied and persisted.
The technical rationale is to persist a fully initialized database (with test data) to the image, so any new container we create from it is ready to go with a fresh dataset.
Normally, mysql does a full database initialization with all your scripts when starting the container. This can easily add ten seconds to every test run.
It will skip that step, since it detects that the data directory is already there are created.

### Running the db separately
You can build and run the image as follows:

```bash
cd db
docker build -t littil-db . 
docker run -p3306:3306 --name=littil-db littil-db
```
