#!/bin/bash

python3.8 -m venv flask_catalog
cd flask_catalog
source ./bin/activate
python3.3 -m pip install flask-sqlalchemy
# write code and run app
python3 run.py

# send requests
python3.8 -m pip install requests

# open in browser
xdg-open "http://127.0.0.1:5000/products"
python3.8
import requests
requests.post("https://127.0.0.1:5000/product-create", data ={"name": "iPhone 5S", "price": "549.0"})

# open in browser again to see the added product
xdg-open "http://127.0.0.1:5000/products"
