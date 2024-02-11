#!/usr/bin/python3
""" Starts a Flash Web Application BIBR"""
from flask import Flask
app = Flask(__name__)


@app.route('/', strict_slashes=False)
def hello_bibr():
    """ Prints a Message when / is called """
    return 'Welcome to  BIBR!'


@app.route('/bibr', strict_slashes=False)
def bibr():
    """ Prints a Message when /bibr is called """
    return 'BIBR'

if __name__ == "__main__":
    """ Main Function """
    app.run(host='0.0.0.0', port=5000)
