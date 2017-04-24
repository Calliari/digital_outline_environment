# 
# Cookbook:: node-server
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# https://supermarket.chef.io/cookbooks/sc-mongodb

# DevOps projetc include_recipe
# This is the recipe for web application vagrant box


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

include_recipe "nodejs"
include_recipe 'git'
include_recipe 'apt'

# nodejs_npm 'pm2'



# include_recipe 'pm2'

# Default runtimes, last one will be the default.
javascript_runtime 'iojs' if node['poise-javascript']['install_iojs']
javascript_runtime 'nodejs' if node['poise-javascript']['install_nodejs']

include_recipe 'pm2'