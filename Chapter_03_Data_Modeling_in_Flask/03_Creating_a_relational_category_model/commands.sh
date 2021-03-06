#!/bin/bash

python3.8 -m venv flask_product_categories
cd flask_product_categories
source ./bin/activate
python3.8 -m pip install flask-sqlalchemy
# write code and run app
python3.8 run.py

# send requests
python3.8 -m pip install requests

# open in browser
xdg-open "http://127.0.0.1:5000/products"
xdg-open "http://127.0.0.1:5000/categories"
python3.8
import requests
requests.post("https://127.0.0.1:5000/category-create", data ={"name": "Phones"})
requests.post("https://127.0.0.1:5000/product-create", data ={"name": "iPhone 5S", "price": "549.0", "category": "Phones"})

# open in browser again to see the added product
xdg-open "http://127.0.0.1:5000/categories"
xdg-open "http://127.0.0.1:5000/products"
