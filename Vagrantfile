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
  servers = [
    {name: "server1", ip: "192.168.10.10", host_port: 18500},
    {name: "server2", ip: "192.168.10.20", host_port: 28500},
    {name: "server3", ip: "192.168.10.30", host_port: 38500},
  ]

  servers.each { |item|
    config.vm.define item[:name] do |s|
      s.vm.box = "bento/rockylinux-8"
      s.vm.hostname = item[:name]

      s.vm.network :private_network, ip: item[:ip]
      s.vm.network "forwarded_port", guest: 8500, host: item[:host_port]

      s.vm.provision "shell", inline: $base
      s.vm.provision "shell", inline: $server
    end
  }

  clients = [
    {name: "client1", ip: "192.168.10.40"},
    {name: "client2", ip: "192.168.10.50"},
    {name: "client3", ip: "192.168.10.60"},
  ]

  clients.each { |item|
    config.vm.define item[:name] do |s|
      s.vm.box = "bento/rockylinux-8"
      s.vm.hostname = item[:name]

      s.vm.network :private_network, ip: item[:ip]

      s.vm.provision "shell", inline: $base
      s.vm.provision "shell", inline: $client
    end
  }
end
