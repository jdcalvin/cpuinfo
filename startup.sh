#!/usr/bin/env bash

echo "Running startup script"
cd /vagrant
bundle install

echo "Starting Server"
rackup -p 3333 -o 0.0.0.0 > /dev/null 2>&1 &
echo "Web Service ready at localhost:8080"