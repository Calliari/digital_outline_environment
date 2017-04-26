required_plugins = [ "vagrant-hostsupdater" , "vagrant-berkshelf" ]
required_plugins.each do |plugin|
    exec "vagrant plugin install #{plugin};vagrant #{ARGV.join(" ")}" unless Vagrant.has_plugin? plugin || ARGV[0] == 'plugin'
end

Vagrant.configure("2") do |config|

# Spin up a virtual machine for application
  config.vm.define "web" do |web|
    web.vm.box = "ubuntu/trusty64" 
    web.vm.box_check_update = true
    web.vm.hostname = "web"
    web.vm.network "private_network", ip: "192.168.10.100"
    web.hostsupdater.aliases = ["development.local"]
    web.vm.synced_folder "../app" , "/home/ubuntu/app"
    # web.vm.synced_folder "../digital_outline_environment" , "/home/ubuntu/digital_outline_environment"

    web.vm.post_up_message = "Welcome! This is the vagrant virtual environment.
  Use the command 'vagrant ssh web' to access your the app.
  Or use 'vagrant ssh db to access the db'"

    web.vm.provision "chef_solo" do |web_chef|
      web_chef.cookbooks_path = ['cookbooks']
      web_chef.run_list = ['recipe[node-server::default]']
    end

  end

# Spin up a virtual machine for database
 config.vm.define "db" do |db|
    db.vm.box = "ubuntu/trusty64"
    db.vm.box_check_update = true
    db.vm.hostname = "db"
    db.vm.network "private_network", ip: "192.168.10.101"
   
    db.vm.provision "chef_solo" do |db_chef|
      db_chef.cookbooks_path = ['cookbooks']
      db_chef.run_list = ['recipe[node-server::mongo]']
    end

  end

end

# https://atlas.hashicorp.com/boxes/search?page=1&provider=virtualbox&q=Official+Ubuntu&sort=created&utf8=%E2%9C%93
# ubuntu/xenial64  --> Official Ubuntu 16.04 LTS (Xenial Xerus) Daily Build
# ubuntu/trusty64  --> Official Ubuntu Server 14.04 LTS (Trusty Tahr) builds