# 
#
# Cookbook:: node-server
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

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

include_recipe 'apt'
include_recipe 'nodejs'
include_recipe 'git'
nodejs_npm 'pm2'



include_recipe 'nodejs::nodejs_from_package'

# https://github.com/customink-webops/magic_shell
magic_shell_environment 'MONGODB_URI' do
  value 'mongodb://192.168.10.101/outliners'
end







