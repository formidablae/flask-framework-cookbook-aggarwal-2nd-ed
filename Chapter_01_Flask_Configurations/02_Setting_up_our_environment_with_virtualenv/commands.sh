#!/bin/bash

pip3 install virtualenv
# Successfully installed distlib-0.3.4 filelock-3.4.2 platformdirs-2.4.1 virtualenv-20.13.0

# create virtual environment
virtualenv my_flask_env

# activate virtual environment
cd my_flask_env
source bin/activate

# install flask
pip3 install flask

# deactivate virtual environment
deactivate

# install virtualenvwrapper
pip3 install virtualenvwrapper
sudo pip3 install virtualenvwrapper
# Successfully installed pbr-5.8.0 stevedore-3.5.0 virtualenv-clone-0.5.7 virtualenvwrapper-4.8.4

export VIRTUALENVWRAPPER_PYTHON=$(which python3)
echo "VIRTUALENVWRAPPER_PYTHON=$(which python3)" >> ~/.bashrc
export WORKON_HOME=$HOME/.virtualenvs
echo "WORKON_HOME=$HOME/.virtualenvs" >> ~/.bashrc
source `which virtualenvwrapper.sh`
echo "source `which virtualenvwrapper.sh`" >> ~/.bashrc
source `sudo which virtualenvwrapper.sh`
echo "source `sudo which virtualenvwrapper.sh`" >> ~/.bashrc

# create virtual environment
mkvirtualenv my_new_flask_env
mv $HOME/.virtualenvs/my_new_flask_env ./my_new_flask_env

# activate virtual environment
cd my_new_flask_env
source bin/activate
# or
# workon my_new_flask_env

# install flask
pip3 install flask

# deactivate virtual environment
deactivate
