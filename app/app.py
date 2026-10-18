"""Mini API du labo DevSecOps.

Modifie MESSAGE ou VERSION, pousse sur main : le pipeline
build -> scan -> signe -> deploie automatiquement.
"""

import os

from flask import Flask, jsonify

VERSION = os.environ.get("APP_VERSION", "1.0.0")
MESSAGE = "Hello from GitHub Actions DevSecOps lab!"

app = Flask(__name__)


@app.get("/")
def index():
    return jsonify(message=MESSAGE, version=VERSION)


@app.get("/healthz")
def healthz():
    return jsonify(status="ok")


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=int(os.environ.get("PORT", "8080")))
