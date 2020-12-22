VAGRANTFILE_API_VERSION = "2"
NUMBER_OF_VMS = 3

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = "ubuntu/xenial64"
    config.ssh.insert_key = false
    config.vm.synced_folder ".", "/vagrant", disabled: true
    config.vm.network "public_network", bridge: "en0: Wi-Fi (AirPort)"
    config.vm.provider :virtualbox do |v|
        v.memory = 512
        v.linked_clone = true
    end

    # Specifying vm specs 
    config.vm.define "server1" do |app|
        app.vm.hostname = "server1"
        app.vm.network :private_network, ip: "192.168.60.5"
    end

    config.vm.define "server2" do |app|
        app.vm.hostname = "server2"
        app.vm.network :private_network, ip: "192.168.60.6"
    end

    config.vm.provision "ansible" do |ansible|
        ansible.playbook = "playbook.yaml"
    end
end
