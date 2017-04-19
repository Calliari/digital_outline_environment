#
# Cookbook:: node-server
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.


# DevOps projetc include_recipe
include_recipe 'apt'
include_recipe 'nodejs'
include_recipe 'git'
# include_recipe "nodejs::npm"
# include_recipe 'nodejs::nodejs_from_package'
# include_recipe "mongodb::default"
# include_recipe 'chef-client'
# include_recipe "npm"



# https://supermarket.chef.io/cookbooks/sc-mongodb



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

execute 'update apt' do
	command 'apt-get update'
	ignore_failure true
end

# execute 'npm install' do
#   	command 'npm install'
# end

# execute "test npm install with node-gyp" do
#   code "call npm install --global node-gyp"
# end

