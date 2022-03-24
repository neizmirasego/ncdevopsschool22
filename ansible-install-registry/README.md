Ansible Playbook 
=========

Ansible Playbook for installing docker registry

Role Variables
----------------

The folder /defaults contains variables for setting up configuration of your docker registry


Running encrypted playbook
----------------

Command for running at command line:

    ansible-playbook playbook-registry.yml --ask-vault-pass

If your host have ssl certificate run role "install-registry-with-cert"

If your host don't have ssl certificate run role "install-registry-no-cert"


Author Information
------------------


