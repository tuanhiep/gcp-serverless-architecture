from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello():
    return 'Hello World Version-3'

if __name__ == '__main__':
    # Use App Engine's automatic port binding
    app.run(host='0.0.0.0', port=8080, debug=True)
