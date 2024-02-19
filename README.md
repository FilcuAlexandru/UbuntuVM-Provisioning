# Ubuntu VM Provisioning with Ansible

This documentation outlines the process of provisioning Ubuntu virtual machines using Vagrant and Ansible. The provision includes setting up common system configurations, services, PostgreSQL, and Docker.

## Prerequisites

Before proceeding with the Ubuntu VMs provisioning, ensure you have the following prerequisites:

1. **Vagrant:** Install Vagrant to manage virtual machine environments. [Download and install Vagrant](https://www.vagrantup.com/downloads.html).

2. **VirtualBox:** VirtualBox is used as the provider for Vagrant to create and manage virtual machines. [Download and install VirtualBox](https://www.virtualbox.org/wiki/Downloads).

3. **Git Bash:** Git Bash provides a command-line interface for interacting with Git and executing shell scripts. [Download and install Git](https://git-scm.com/downloads) (select Git Bash during installation).

## Project Structure

### Ansible Folder

The folder called "Ansible" contains the following files:

- **ansible.cfg:** Configures default settings for Ansible. It sets the inventory file path, stdout callback, and SSH connection settings.

- **hosts.yml:** Specifies the inventory of hosts along with their connection details, including IP addresses, connection types, and hostnames.

- **playbook.yml:** Defines tasks to configure Ubuntu VMs. It includes tasks such as updating packages, installing software, configuring services, and managing users.

### Provisioning Folder

The folder called "Provisioning" contains the following files:

- **Vagrant_Install_Ansible.sh:** A shell script that installs necessary packages like Python 3 and Ansible using pip. It also adds pip-installed binaries to the PATH.

- **get-pip.py:** A Python script used for bootstrapping the installation of pip.

- **Vagrant_Guest_SSH_ID_RSA:** A file containing the SSH private key used for passwordless SSH access to the VMs.

### Vagrantfile

The Vagrantfile defines the configuration for provisioning virtual machines using Vagrant. It sets up VMs with specific settings, provisions them with Ansible, and configures networks and resources.

## Ubuntu VMs Provisioning Documentation

### Provisioning Steps

1. **Clone the Repository:**

    ```bash
    git clone https://github.com/FilcuAlexandru/UbuntuVM-Provisioning
    cd UbuntuVM-Provisioning
    ```

2. **Start setting up virtual machines 2 and 3 with Vagrant:**

    ```bash
    vagrant up machine-vm2 machine-vm3
    ```

4. **Start virtual machine 1 after virtual machines 2 and 3 have been created:**

    Virtual Machine 1 will run an ansible playbook upon creation that will configure and install several things with it.

    ```bash
    vagrant up machine-vm1
    ```

6. **Access the Provisioned Ubuntu virtual machines:**

    Once the provisioning process is complete, access the provisioned Ubuntu VM using SSH:

    ```bash
    vagrant ssh machine-vm1
    ```

## Conclusion

With the provided documentation, you can seamlessly provision an Ubuntu virtual machine using Vagrant and Ansible, automate the setup of various services, and customize the configuration based on your requirements. Happy provisioning! 🚀🐧
