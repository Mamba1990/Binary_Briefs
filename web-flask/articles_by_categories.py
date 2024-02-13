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


@app.route('/articles_list', strict_slashes=False)
def articles_list():
    """ displays a HTML page with a list of articles """
    articles = storage.all(Article).values()
    articles = sorted(articles, key=lambda k: k.title)
    return render_template('articles_list.html', articles=articles)


@app.route('/articles_by_categories', strict_slashes=False)
def categories_list():
    """ displays a HTML page with a list of articles by categories """
    articles = storage.all(Article).values()
    articles = sorted(articles, key=lambda k: k.title)
    art_ct = []
    for article in articles:
        art_ct.append([article, sorted(article.categories, key=lambda k: k.title)])
    return render_template('articles_by_categories.html',
                           articles=art_ct,
                           h_1="Articles")


if __name__ == "__main__":
    """ Main Function """
    app.run(host='0.0.0.0', port=5000)
