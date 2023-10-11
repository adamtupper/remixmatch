#!/bin/bash

# Switch to project root
cd ..

# Setup virtual environment
virtualenv env -p python3.7
source env/bin/activate
pip install --upgrade pip

# Install project dependencies
pip install -r requirements.txt