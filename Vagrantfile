VAGRANTFILE_API_VERSION = "2"
NUMBER_OF_MASTER_NODES = 1
NUMBER_OF_WORKER_NODES = 0

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    #config.vm.box = "ubuntu/xenial64"
    config.vm.box = "ubuntu/bionic64"
    config.ssh.insert_key = false
    config.vm.synced_folder ".", "/vagrant", disabled: true
    
    # for syncing kubernetes manifest files
    #config.vm.synced_folder "<host-machine-directory>", "<guest-machine-directory"
    #config.vm.synced_folder "/Users/tanjianhao/Documents/repo/personal/fleet-infra", "/home/vagrant/fleet-infra"
    config.vm.synced_folder "/Users/tanjianhao/Documents/repo/personal/cka", "/home/vagrant/cka"
    config.vm.synced_folder "/Users/tanjianhao/Documents/repo/stackops-flux-deployment", "/home/vagrant/stackops-flux-deployment"
    config.vm.synced_folder "/Users/tanjianhao/Documents/repo/apollo-flux-deployment", "/home/vagrant/apollo-flux-deployment"
    #config.vm.synced_folder "/Users/tanjianhao/Documents/repo/personal/blackbox_exporter", "/home/vagrant/blackbox_exporter"
    config.vm.synced_folder "/Users/tanjianhao/Documents/repo/personal/siera-kube-watch", "/home/vagrant/siera-kube-watch"
    config.vm.synced_folder "/Users/tanjianhao/Documents/repo/stackops-helm-charts", "/home/vagrant/stackops-helm-charts"
    config.vm.synced_folder "/Users/tanjianhao/Documents/repo/stackops-atlassian-exporter", "/home/vagrant/stackops-atlassian-exporter"

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

    config.vm.provision "shell", path: "./scripts/setup.sh"
end
