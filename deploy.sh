#pull down new code

cd ~/env
git pull
berks vendor cookbooks
sudo chef-client --local-mode --runlist 'recipe[node-server]'


cd ~/app
git pull
npm install
bower install


cd ~/env
pm2 kill
pm2 start production.json
