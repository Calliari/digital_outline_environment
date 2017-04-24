# 
#
# Cookbook:: node-server
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.


include_recipe 'apt'


package 'nginx'


package 'nginx' do 
	action :install
end

service 'nginx' do 
	supports status: true, restart: true, reload: true
	action [:enable, :start]
end

template '/etc/nginx/sites-available/default' do
	source 'nginx.default.erb'
	notifies :reload, "service[nginx]"
end

# https://github.com/customink-webops/magic_shell
magic_shell_environment 'MONGODB_URI' do
  value 'mongodb://192.168.10.101/outliners'
end


include_recipe 'git'
include_recipe 'nodejs'



execute 'nodejs-sources' do
  command 'curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -'
end

package 'nodejs' do
  version '6.10.0'
end

execute 'npm install' do
  command 'sudo npm install -g pm2'
end





