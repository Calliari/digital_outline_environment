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


# nodejs_npm 'pm2'
# include_recipe 'nodejs::nodejs_from_package'


# DevOps projetc include_recipe
include_recipe 'apt'
include_recipe 'nodejs'
include_recipe 'git'
include_recipe "nodejs::npm"
nodejs_npm 'pm2'
include_recipe 'nodejs::nodejs_from_package'

# include_recipe 'mongodb'

