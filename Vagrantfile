$base = <<-SCRIPT
# setup clean
yum clean all

# setup python
yum -y install python39-devel

# setup ansible-core
python3 -m venv /opt/ansible
/opt/ansible/bin/python3 -m pip install --upgrade pip
/opt/ansible/bin/pip3 install ansible-core
SCRIPT

$client = <<-SCRIPT
# setup consul client
cd /vagrant/ansible
make runclient
SCRIPT

$server = <<-SCRIPT
# setup consul server
cd /vagrant/ansible
make runserver
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.define "server1" do |s|
    s.vm.box = "bento/rockylinux-8"
    s.vm.hostname = "server1"

    s.vm.network :private_network, ip: "192.168.10.10"
    s.vm.network "forwarded_port", guest: 8500, host: 18500

    s.vm.provision "shell", inline: $base
    s.vm.provision "shell", inline: $server
  end

  config.vm.define "server2" do |s|
    s.vm.box = "bento/rockylinux-8"
    s.vm.hostname = "server2"

    s.vm.network :private_network, ip: "192.168.10.20"
    s.vm.network "forwarded_port", guest: 8500, host: 28500

    s.vm.provision "shell", inline: $base
    s.vm.provision "shell", inline: $server
  end

  config.vm.define "server3" do |s|
    s.vm.box = "bento/rockylinux-8"
    s.vm.hostname = "server3"

    s.vm.network :private_network, ip: "192.168.10.30"
    s.vm.network "forwarded_port", guest: 8500, host: 38500

    s.vm.provision "shell", inline: $base
    s.vm.provision "shell", inline: $server
  end

  config.vm.define "client1" do |s|
    s.vm.box = "bento/rockylinux-8"
    s.vm.hostname = "client1"

    s.vm.network :private_network, ip: "192.168.10.40"

    s.vm.provision "shell", inline: $base
    s.vm.provision "shell", inline: $client
  end
end
