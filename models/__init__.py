#!/usr/bin/python3
"""
initialize the models package
"""

from os import getenv


storage_t = getenv("BB_TYPE_STORAGE")

if storage_t == "db":
    from models.engine.dbStorage import DBStorage
    storage = DBStorage()
else:
    from models.engine.fileStorage import FileStorage
    storage = FileStorage()
storage.reload()

