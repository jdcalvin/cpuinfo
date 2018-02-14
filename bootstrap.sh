#!/usr/bin/env bash

echo "Running initial provision script - Thiy may take awhile"
# rvm and ruby
su - vagrant -c 'command curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -'
su - vagrant -c 'curl -sSL https://get.rvm.io | bash -s stable --ruby=2.5.0'
su - vagrant -c 'rvm rvmrc warning ignore allGemfiles'
su - vagrant -c 'echo "gem: --no-ri --no-rdoc" > ~/.gemrc'

su - vagrant -c "gem install bundler"
echo "Ruby 2.5.0 installed"


