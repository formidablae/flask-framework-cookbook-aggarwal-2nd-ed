#!/bin/bash

python3.8 -m venv flask_product_categories
cd flask_product_categories
source ./bin/activate
python3.8 -m pip install flask
python3.8 -m pip install flask-sqlalchemy
python3.8 -m pip install requests
export FLASK_APP=my_app

# install Redis
curl -fsSL https://packages.redis.io/gpg | sudo gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/redis.list
sudo apt-get update
sudo apt-get install redis
python3.8 -m pip install Redis

# write code and run app
python3.8 run.py
