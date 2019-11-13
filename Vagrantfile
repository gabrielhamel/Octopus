IMAGE = "debian/buster64"
VM_COUNT = 5

Vagrant.configure("2") do |config|
  (1..VM_COUNT).each do |i|
    config.vm.define "VM#{i}" do |subconfig|
      subconfig.vm.box = IMAGE
      subconfig.vm.hostname = "VM#{i}"
      subconfig.vm.network "private_network", ip: "100.100.100.10#{i}"
    end
  end
  config.vm.define "VM1" do |result|
    result.vm.network "forwarded_port", guest: 80, host: 5001
  end
  config.vm.define "VM2" do |poll|
    poll.vm.network "forwarded_port", guest: 80, host: 5000
  end
end
