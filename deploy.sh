#pull down new code

cd ~/digital_outline_environment
git pull
berks vendor cookbooks
sudo chef-client --local-mode --runlist 'recipe[node-server]'


cd ~/digital_outline_uat
git pull
sudo npm install
pm2 kill
pm2 start app.js