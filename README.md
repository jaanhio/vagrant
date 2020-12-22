# About
This repo contains code for provisioning VMs quickly using `vagrant`.

# Prerequisite
Make sure `Ansible` has been installed and configured properly on machine. Refer to https://github.com/jaanhio/mac-development-setup for instructions.

# How to set up new VMs
1. Set up the desired configs in `Vagrantfile`
2. Run `vagrant up` to spin up the VMs

# How to provision VMs
1. Set up the desired packages to be installed via ansible `playbook.yaml`
2. Run `vagrant provision`

# How to delete VMs
1. Run `vagrant destroy`