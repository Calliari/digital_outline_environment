default['nodejs']['install_method'] = "binary"
default['nodejs']['version'] = '6.10.0'
default['nodejs']['binary']['checksum'] = '99c4136cf61761fac5ac57f80544140a3793b63e00a65d4a0e528c9db328bf40'

# Used for the default recipe.
default['poise-javascript']['install_nodejs'] = true
default['poise-javascript']['install_iojs'] = false


default_unless['pm2']['pm2_version'] = 'latest'
default_unless['pm2']['npm_version'] = 'latest'
default_unless['pm2']['node_version'] = '4.5.0'