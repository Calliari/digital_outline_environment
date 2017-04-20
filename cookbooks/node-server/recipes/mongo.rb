# 
# Cookbook:: node-server
# Recipe:: mongo
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# https://supermarket.chef.io/cookbooks/sc-mongodb

# DevOps projetc include_recipe

# This is the recipe for mongo vagrant box

include_recipe 'apt'
include_recipe 'mongodb3::default'
