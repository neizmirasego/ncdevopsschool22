[ci]
ci-1 ansible_host=34.118.122.9 ansible_ssh_user=lobofffailodrom

[dev]
dev-1 ansible_host=${ip} ansible_ssh_user=lobofffailodrom

[registry]
reg-server ansible_host=35.225.221.195 ansible_ssh_user=lobofffailodrom

[all:vars]
ansible_python_interpreter=/usr/bin/python3
