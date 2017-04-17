# #!/bin/bash
#
# vagrant destroy -f && vagrant up && vagrant ssh
###########################################

# # Update the souces list
# sudo apt-get update -y

# # Upgrade any packages available
# sudo apt-get upgrade -y

# # Install the package for nginx
# sudo apt-get install nginx -y nodejs

# # install node.js  version 7
# # sudo npm cache clean -f
# # sudo apt-get install -y 

# # install node.js  version 6
#  curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
#  sudo apt-get install -y nodejs


# # install the pm2 from npm
# sudo npm install pm2 -g

# #  Install the git 
# sudo apt-get install git -y


# #############################


# #Download the curl and nginx
# sudo apt-get install curl
# sudo apt-get install nginx

# # remove default
# sudo rm -r /etc/nginx/sites-available/default 

# cd ~/

#  sudo cp /home/ubuntu/environment/nginx.default /etc/nginx/sites-available

#  sudo mv /etc/nginx/sites-available/nginx.default /etc/nginx/sites-available/default

# # restart the server
# sudo service nginx restart

# echo 'script runned'

# ############## CHEF dk in the instances ###############
# https://kuldeeparya.wordpress.com/2015/10/25/how-to-set-up-install-chef-dk-on-ubuntu/
# cd /home/ubuntu
# sudo mkdir chef_DK 
# cd chef_DK
# sudo wget https://packages.chef.io/files/stable/chefdk/1.3.40/ubuntu/16.04/chefdk_1.3.40-1_amd64.deb
# sudo dpkg -i chefdk_1.3.40-1_amd64.deb

# ############## CHEF dk in the instances ###############

# pull down new code


# cd /home/ubuntu/
# git clone git clone https://github.com/Calliari/digital_outline_environment.git
# git pull
# berks vendor cookbooks
# sudo chef-client --local-mode --runlist 'recipe[node-server]'

# cd ~/app
# git pull
# sudo npm install
# pm2 kill
# pm2 start app.js



