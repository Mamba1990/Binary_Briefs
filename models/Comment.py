#!/usr/bin/python
""" holds class Comment"""
import models
from models.BaseModel import BaseModel, Base
from os import getenv
import sqlalchemy
from sqlalchemy import Column, String, ForeignKey


class Comment(BaseModel, Base):
    """Representation of Comment """
    if models.storage_t == 'db':
        __tablename__ = 'comments'
        article_id = Column(String(60), ForeignKey('articles.id'), nullable=False)
        user_id = Column(String(60), ForeignKey('users.id'), nullable=False)
        text = Column(String(1024), nullable=False)
    else:
        article_id = ""
        user_id = ""
        text = ""

    def __init__(self, *args, **kwargs):
        """initializes Comment"""
        super().__init__(*args, **kwargs)
