#!/usr/bin/python
""" holds class Article"""
import models
from models.BaseModel import BaseModel, Base
from os import getenv
import sqlalchemy
from sqlalchemy import Column, String, Integer, Float, ForeignKey, Table
from sqlalchemy.orm import relationship

if models.storage_t == 'db':
    article_category = Table('article_category', Base.metadata,
                          Column('article_id', String(60),
                                 ForeignKey('articles.id', onupdate='CASCADE',
                                            ondelete='CASCADE'),
                                 primary_key=True),
                          Column('category_id', String(60),
                                 ForeignKey('categories.id', onupdate='CASCADE',
                                            ondelete='CASCADE'),
                                 primary_key=True))


class Article(BaseModel, Base):
    """Representation of Article """
    if models.storage_t == 'db':
        __tablename__ = 'articles'
        user_id = Column(String(60), ForeignKey('users.id'), nullable=False)
        title = Column(String(500), nullable=False)
        text = Column(Text, nullable=False)
        author = Column(String(128), nullable=False)
        comments = relationship("Comment",
                               backref="Article",
                               cascade="all, delete, delete-orphan")
        categories = relationship("Category",
                                 secondary=article_category,
                                 viewonly=False)
    else:
        user_id = ""
        title = ""
        text = None
        price_by_night = 0
        author = ""

    def __init__(self, *args, **kwargs):
        """initializes Article"""
        super().__init__(*args, **kwargs)

    if models.storage_t != 'db':
        @property
        def comments(self):
            """getter attribute returns the list of Comment instances"""
            from models.Comment import Comment
            comment_list = []
            all_comments = models.storage.all(Comment)
            for comment in all_comments.values():
                if comment.article_id == self.id:
                    comment_list.append(comment)
            return comment_list

        @property
        def categories(self):
            """getter attribute returns the list of Category instances"""
            from models.category import Category
            category_list = []
            all_categories = models.storage.all(Category)
            for category in all_categories.values():
                if category.article_id == self.id:
                    category_list.append(category)
            return category_list
