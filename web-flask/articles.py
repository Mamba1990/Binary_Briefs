#!/usr/bin/python3
""" Starts a Flash Web Application """
from models import storage
from models.Article import Article
from os import environ
from flask import Flask, render_template
app = Flask(__name__)
# app.jinja_env.trim_blocks = True
# app.jinja_env.lstrip_blocks = True


@app.teardown_appcontext
def close_db(error):
    """ Remove the current SQLAlchemy Session """
    storage.close()


@app.route('/articles', strict_slashes=False)
@app.route('/articles/<id>', strict_slashes=False)
def articles_article(id=""):
    """ displays a HTML page with a list of comments by articles """
    articles = storage.all(Article).values()
    articles = sorted(articles, key=lambda k: k.title)
    found = 0
    articles = ""
    comments = []

    for i in articles:
        if id == i.id:
            article = i
            found = 1
            break
    if found:
        articles = sorted(article.comments, key=lambda k: k.title)
        article = article.title

    if id and not found:
        found = 2

    return render_template('9-states.html',
                           article=article,
                           array=articles,
                           found=found)


if __name__ == "__main__":
    """ Main Function """
    app.run(host='0.0.0.0', port=5000)
