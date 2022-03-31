from flask import Flask
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:////tmp/test.db"
db = SQLAlchemy(app)

from my_app.catalog_with_categories.views import catalog_with_categories

app.register_blueprint(catalog_with_categories)

db.create_all()
