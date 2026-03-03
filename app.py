from flask import Flask

app = Flask(__name__)

@app.route('/hello')
def hello():
    return """
    <!DOCTYPE html>
    <html>
    <head>
        <title>Üdvözlet 2</title>
    </head>
    <body>
        <h1>Hello :)</h1>
        <p>Webhook?</p>
    </body>
    </html>
    """

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

