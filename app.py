from flask import Flask

app = Flask(__name__)

@app.route('/hello')
def hello():
    # Itt közvetlenül adjuk vissza a HTML-t
    return """
    <!DOCTYPE html>
    <html>
    <head>
        <title>Üdvözlet</title>
    </head>
    <body>
        <h1>Hello :)</h1>
    </body>
    </html>
    """

if __name__ == '__main__':
    app.run(debug=True)

