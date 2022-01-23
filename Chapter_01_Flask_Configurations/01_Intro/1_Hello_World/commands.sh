#!/bin/bash

pip3 install flask
# Successfully installed Jinja2-3.0.3 MarkupSafe-2.0.1 Werkzeug-2.0.2 click-8.0.3 flask-2.0.2 itsdangerous-2.0.1

python3 app.py
# Serving Flask app 'app' (lazy loading)
# * Environment: production
#   WARNING: This is a development server. Do not use it in a production deployment.
#   Use a production WSGI server instead.
# * Debug mode: off
# * Running on http://127.0.0.1:5000/ (Press CTRL+C to quit)

# or alternatively
# (first export environment variable)
export FLASK_APP=app.py
# after that run flask command
flask run
# or
python3 -m flask run
# * Serving Flask app 'app.py' (lazy loading)
# * Environment: production
#   WARNING: This is a development server. Do not use it in a production deployment.
#   Use a production WSGI server instead.
# * Debug mode: off
# * Running on http://127.0.0.1:5000/ (Press CTRL+C to quit)

# Visit 127.0.0.1:5000 on a browser
xdg-open http://127.0.0.1:5000/
