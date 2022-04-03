#!/bin/bash

python3.8 -m venv flask_product_categories
cd flask_product_categories
source ./bin/activate
python3.8 -m pip install flask
python3.8 -m pip install flask-sqlalchemy
python3.8 -m pip install Flask-Migrate
export FLASK_APP=my_app
# write code and run app
python3.8 run.py

# send requests
python3.8 -m pip install requests

# initalize and run migrations
flask db init
flask db migrate
flask db upgrade
#or
python3.8 -m flask db init
python3.8 -m flask db migrate
python3.8 -m flask db upgrade
