import flask, json
from flask import request
from google.cloud import bigquery

app = flask.Flask(__name__)

bigquery_client = bigquery.Client()


@app.route("/")
def main():
    post_id = request.args.get('post_id', default='1', type=int)
    sql = """
        SELECT
        answer_count,comment_count
        FROM `bigquery-public-data.stackoverflow.stackoverflow_posts`
        where id={0}
    """.format(int(post_id))

    query_job = bigquery_client.query(sql)
    rows = list(query_job)  # Convert to a list to check if it’s empty

    if not rows:
        return json.dumps({"error": "Post not found"}), 404

    for row in rows:
        a = row[0]
        b = row[1]

    post_response = {"answer_count": a, "comment_count": b}
    return json.dumps(post_response)


if __name__ == "__main__":
    app.run(host="127.0.0.1", port=8081, debug=True)
