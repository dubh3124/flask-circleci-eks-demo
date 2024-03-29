from flask import Flask


def create_app(env):
    app = Flask(__name__)

    @app.route('/')
    def hello_world():
        return 'Hello World!'

    return app