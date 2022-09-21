$base = <<-SCRIPT
# clean up
yum clean all

# install python
yum -y install python39-devel

# install ansible-core
python3 -m venv /opt/ansible
/opt/ansible/bin/python3 -m pip install --upgrade pip
/opt/ansible/bin/pip3 install ansible-core
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.define "server1" do |s|
    s.vm.box = "bento/rockylinux-8"
    s.vm.hostname = "server1"

    s.vm.network :private_network, ip: "192.168.10.10"
    s.vm.network "forwarded_port", guest: 8500, host: 18500

    s.vm.provision "shell", inline: $base
  end

  config.vm.define "server2" do |s|
    s.vm.box = "bento/rockylinux-8"
    s.vm.hostname = "server2"

    s.vm.network :private_network, ip: "192.168.10.20"
    s.vm.network "forwarded_port", guest: 8500, host: 28500

    s.vm.provision "shell", inline: $base
  end

  config.vm.define "server3" do |s|
    s.vm.box = "bento/rockylinux-8"
    s.vm.hostname = "server3"

    s.vm.network :private_network, ip: "192.168.10.30"
    s.vm.network "forwarded_port", guest: 8500, host: 38500

    s.vm.provision "shell", inline: $base
  end
end
