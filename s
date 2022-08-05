
[application:vars]
ansible_user = ubuntu

ansible_port = 22

private_key_file = /home/omar/omar/iti/terraform/lab01/ansible/thekey.pem

ansible_ssh_common_args= '-o ProxyCommand="ssh -i /home/omar/omar/iti/terraform/lab01/ansible/thekey.pem -W %h:%p -q ubuntu@18.223.125.187"'
