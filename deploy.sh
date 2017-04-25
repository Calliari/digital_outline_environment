#pull down new code

cd ~/digital_outline_environment
git pull
berks vendor cookbooks
sudo chef-client --local-mode --runlist 'recipe[node-server]'


cd ~/digital_outlineApp
git pull
sudo npm install pm2
pm2 kill
# pm2 start app.js 
pm2 start production.json
