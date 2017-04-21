required_plugins = [ "vagrant-hostsupdater" , "vagrant-berkshelf" ]
required_plugins.each do |plugin|
    exec "vagrant plugin install #{plugin};vagrant #{ARGV.join(" ")}" unless Vagrant.has_plugin? plugin || ARGV[0] == 'plugin'
end

Vagrant.configure("2") do |config|

# Spin up a virtual machine for application
  config.vm.define "web" do |web|
    web.vm.box = "ubuntu/trusty64"
    web.vm.hostname = "web"
    web.vm.network "private_network", ip: "192.168.10.100"
    web.hostsupdater.aliases = ["development.local"]
    web.vm.synced_folder "../digital_outline_uat" , "/home/ubuntu/digital_outline_uat"
    web.vm.synced_folder "../digital_outline_environment" , "/home/ubuntu/digital_outline_environment"

    web.vm.provision "chef_solo" do |web_chef|
      web_chef.cookbooks_path = ['cookbooks']
      web_chef.run_list = ['recipe[node-server::default]']
    end

  end

# Spin up a virtual machine for database
 config.vm.define "db" do |db|
    db.vm.box = "ubuntu/trusty64"
    db.vm.hostname = "db"
    db.vm.network "private_network", ip: "192.168.10.101"
   
    db.vm.provision "chef_solo" do |db_chef|
      db_chef.cookbooks_path = ['cookbooks']
      db_chef.run_list = ['recipe[node-server::mongo]']
    end

  end

end

