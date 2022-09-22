.DEFAULT: help

help:
	@echo "make runserver		run consul server ansible-playbook"
	@echo "make runclient		run consul client ansible-playbook"

runserver:
	@/opt/ansible/bin/ansible-playbook -i localhost, consul-server.yml

runclient:
	@/opt/ansible/bin/ansible-playbook -i localhost, consul-client.yml
