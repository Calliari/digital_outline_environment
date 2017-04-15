#!/bin/bash

# vagrant destroy -f && vagrant up && vagrant ssh

# Install the mongo db
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
echo 'installing mogodb DATABASE *******************... '

# Update the souces list
sudo apt-get update -y
echo 'updating packages and software dependencies *********************...'

# Upgrade any packages available
sudo apt-get upgrade -y
echo 'upgrading  *********************...'

sudo apt-get install -y --allow-unauthenticated mongodb-org
echo ' authenticated ok'

# creating new mongo path to start use mongo 
 mongod --dbpath /var/lib/mongodb/data/db
 echo 'creating new mongo path to start use mongo *****************......'

# starting mongo
sudo mongod
echo 'starting mongo *************************...'

############# database installed up and running ######################

# Install the package for nginx
sudo apt-get install nginx -y
echo 'installing nginx *****************...'

# install node.js  version 6
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs
echo 'install nodejs ******************...'

#  Install git 
sudo apt-get install git -y
echo 'installing git ********************...'

# remove default file from nginx 
sudo rm -r /etc/nginx/sites-available/default 
echo 'removing default nginx file **************************...'

# cd /home/ubuntu/digital_outline
cd /home/ubuntu

# restart the server
sudo service nginx restart
echo 'starting service nginx *************************...'




# cd digital_outline
# sudo chmod +x app.js package.json
# sudo npm install

# node app.js
# echo 'lanching app.js in digital_outline directory ************....'


# copy new nginx.default to /etc/nginx/sites-available/
sudo cp /home/ubuntu/digital_outline_environment/nginx.default /etc/nginx/sites-available/
echo 'coping nginx.default file into /etc/nginx/sites-available/ ****************...'

# rename nginx.default to default 
sudo mv /etc/nginx/sites-available/nginx.default /etc/nginx/sites-available/default
echo 'renaming nginx.default file to default in directory --> /etc/nginx/sites-available/ ***************...'



# berks vendor cookbooks
# sudo chef-client --local-mode --runlist 'recipe[node-server]'












# # install aws cli
# sudo apt-get --assume-yes install python-pip
# apt-get install python-pip
# pip install awscli
# sudo apt-get install awscli


# # install python
# sudo apt-get install python3.4
# sudo curl -O https://bootstrap.pypa.io/get-pip.py
# sudo python3 get-pip.py --user




# sudo npm install -g bower
# bower install
# npm install -g mocha
# npm install request --save
# npm install chai




# # digital_outline_enviroment UAT
# cd /home/ubuntu/digital_outline_enviroment
# git pull
# berks vendor cookbooks
# sudo chef-client --local-mode --runlist 'recipe[node-server]'


# # digital_outline APP PRODUCTION
# cd /home/ubuntu/digital_outline
# git pull
# sudo chmod +x app.js 
# sudo npm install express

# sudo npm install npm@latest
# echo 'installing npm *********************...'

# npm install pm2 -g
# echo 'installing pm2 *************************...'

# node app.js
# echo 'lanching app.js in digital_outline directory ************....'



