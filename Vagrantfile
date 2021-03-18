Vagrant.configure("2") do |config|
  config.vm.box = "centos/8"
  config.vm.provider "virtualbox" do |v|
    v.cpus = 2
  end
  config.vm.network "private_network", ip: "172.30.1.5"
  if Vagrant.has_plugin? "vagrant-vbguest"
    config.vbguest.auto_update = false
  end
    config.vm.provision "shell" do |s|
    	s.path = "setup.sh"
    end 
end
