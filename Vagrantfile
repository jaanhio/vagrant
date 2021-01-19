VAGRANTFILE_API_VERSION = "2"
NUMBER_OF_MASTER_NODES = 1
NUMBER_OF_WORKER_NODES = 2

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = "ubuntu/xenial64"
    config.ssh.insert_key = false
    config.vm.synced_folder ".", "/vagrant", disabled: true
    config.vm.network "public_network", bridge: "en0: Wi-Fi (AirPort)"

    config.vm.provider :virtualbox do |v|
        v.memory = 2048
        v.cpus = 2
        v.linked_clone = true
    end

    (1..NUMBER_OF_MASTER_NODES).each do |i|
      config.vm.define "kubemaster#{i}" do |node|
          node.vm.hostname = "kubemaster#{i}"
          node.vm.network :private_network, ip: "192.168.60.#{1 + i}"
      end
    end

    (1..NUMBER_OF_WORKER_NODES).each do |i|
      config.vm.define "kubeworker#{i}" do |node|
          node.vm.hostname = "kubeworker#{i}"
          node.vm.network :private_network, ip: "192.168.60.#{100 + i}"
      end
    end
end
