#!/usr/bin/python3
""" Starts a Flash Web Application """
from models import storage
from models.Article import Article
from flask import Flask, render_template
app = Flask(__name__)
# app.jinja_env.trim_blocks = True
# app.jinja_env.lstrip_blocks = True


@app.teardown_appcontext
def close_db(error):
    """ Remove the current SQLAlchemy Session """
    storage.close()


@app.route('/articles_list', strict_slashes=False)
def states_list():
    """ displays a HTML page with a list of Articles """
    articles = storage.all(Article).values()
    articles = sorted(articles, key=lambda k: k.title)
    return render_template('articles_list.html', articles=articles)


if __name__ == "__main__":
    """ Main Function """
    app.run(host='0.0.0.0', port=5000)
