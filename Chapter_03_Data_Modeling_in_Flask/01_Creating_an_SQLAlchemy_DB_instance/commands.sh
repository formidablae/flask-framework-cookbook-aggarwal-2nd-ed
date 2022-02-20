#!/bin/bash

python3 -m venv flask_catalog
cd flask_catalog
source ./bin/activate
pip3 install flask-sqlalchemy
# write code
python3 run.py
