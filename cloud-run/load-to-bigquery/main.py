import logging

from flask import Flask
from google.cloud import bigquery

logging.basicConfig(level=logging.DEBUG)

app = Flask(__name__)
client = bigquery.Client()

@app.route('/')
def main():
    try:
        table_id = "ferrous-depth-436501-q2.udemy_course.us_states"
        job_config = bigquery.LoadJobConfig(
            write_disposition=bigquery.WriteDisposition.WRITE_TRUNCATE,
            source_format=bigquery.SourceFormat.CSV,
            skip_leading_rows=1,
        )
        uri = "gs://ferrous-depth-436501-q2-test-bucket/us-states/us-states.csv"
        load_job = client.load_table_from_uri(
            uri, table_id, job_config=job_config
        )

        load_job.result()  # Wait for job to complete.

        destination_table = client.get_table(table_id)
        return {"data": destination_table.num_rows}
    except Exception as e:
        logging.error(f"Error: {e}")
        return {"error": str(e)}, 500
