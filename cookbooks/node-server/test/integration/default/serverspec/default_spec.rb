require 'serverspec'

# Required by serverspec
set :backend, :exec

describe package ('nginx') do
	it { should be_installed }
end

describe service ('nginx') do 
	it { should be_running }
	it { should be_enabled }
end

describe port(80) do
	it { should be_listening }
end

describe command ("node -v") do 
	its (:stdout) { should match /6\.10\.0/ }
end

describe command ("git --version") do 
	its (:stdout) { should match /2\.7\.4/ }
end

describe command ("npm -v") do 
	its (:stdout) { should match /3\.10\.10/ }
end

describe package ("pm2") do 
	it { should be_installed.by('npm') }
end






# chef exec kitchen test -d never

# chef exec kitchen verify






