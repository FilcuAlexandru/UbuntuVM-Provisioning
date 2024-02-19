Vagrant.configure("2") do |config|

  # Set the default timeout to 20 minutes
  config.vm.boot_timeout = 1200 # 20 minutes in seconds

  # Set the timezone of the virtual machine
  config.vm.provision "shell", inline: "sudo timedatectl set-timezone Europe/Bucharest"

  # Add SSH public key to authorized_keys file for passwordless SSH access
  config.vm.provision "shell", inline: "cat /vagrant/Provisioning/Vagrant_Guest_SSH_ID_RSA.pub >>~/.ssh/authorized_keys", privileged: false

  ####################################################
  #                                                  #
  #  - Settings applied to the VMs in Virtualbox -   #
  #                                                  #
  ####################################################

  # Provider-specific settings (VirtualBox)
  config.vm.provider "virtualbox" do |v|
    # Set memory for the virtual machine
    v.memory = 8192  # 8GB RAM
  end

  # Use Ubuntu 20.04 as the base box for all VMs
  config.vm.box = "ubuntu/focal64"

  ########################
  #                      #
  #  -  Create VM 1 -    #
  #                      #
  ########################

  config.vm.define "machine-vm1" do |vm1|
    # Configure private network for VM1
    vm1.vm.network "private_network", ip: '192.168.56.21', :adapter => 2

    # Provider-specific settings (VirtualBox) for VM1
    vm1.vm.provider "virtualbox" do |v|
      # Set memory for the virtual machine
      v.memory = 8192  # 8GB RAM
    end

    #############################
    #                           #
    # - Provisioning for VM1 -  #
    #                           #
    #############################

    # Copy SSH private key to VM1
    vm1.vm.provision "file", source: "Provisioning/Vagrant_Guest_SSH_ID_RSA", destination: "~/.ssh/id_rsa"
    # Set permissions for SSH private key
    vm1.vm.provision "shell", inline: "chmod 400 ~/.ssh/id_rsa", privileged: false
    # Install Ansible on VM1
    vm1.vm.provision "shell", inline: "/vagrant/Provisioning/Vagrant_Install_Ansible.sh", privileged: false
    # Install pip and Ansible using get-pip.py
    vm1.vm.provision "shell", inline: "sudo apt update && sudo apt install -y python3"
    vm1.vm.provision "file", source: "Provisioning/get-pip.py", destination: "/tmp/get-pip.py"
    vm1.vm.provision "shell", inline: "sudo python3 /tmp/get-pip.py"
    vm1.vm.provision "shell", inline: "sudo pip install ansible"
    # Copy Ansible configuration file to VM1
    vm1.vm.provision "file", source: "Ansible/ansible.cfg", destination: "~/.ansible.cfg"
    # Provision all VMs including VM1 with Ansible, using a storage host as the control node
    vm1.vm.provision "shell", inline: "ansible-playbook -i /vagrant/Ansible/hosts.yml /vagrant/Ansible/playbook.yml", privileged: false
  end

  ########################
  #                      #
  #  -  Create VM 2 -    #
  #                      #
  ########################

  config.vm.define "machine-vm2" do |vm2|
    # Configure private network for VM2
    vm2.vm.network "private_network", ip: '192.168.56.19', :adapter => 2
    # Set memory for the virtual machine
    vm2.vm.provider "virtualbox" do |v|
      v.memory = 8192  # 8GB RAM
    end
  end

  ########################
  #                      #
  #  -  Create VM 3 -    #
  #                      #
  ########################

  config.vm.define "machine-vm3" do |vm3|
    # Configure private network for VM3
    vm3.vm.network "private_network", ip: '192.168.56.20', :adapter => 2
    # Set memory for the virtual machine
    vm3.vm.provider "virtualbox" do |v|
      v.memory = 8192  # 8GB RAM
    end
  end
end

