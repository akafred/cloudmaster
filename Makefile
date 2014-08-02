
default: reload provision

reload:
	vagrant halt
	vagrant up

provision:
	vagrant ssh -c 'sudo salt-call --local state.highstate'
