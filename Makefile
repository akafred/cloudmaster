
default: reload provision cloud_create cloud_query

reload:
	vagrant halt
	vagrant up

VSSH=vagrant ssh -c

provision:
	$(VSSH) 'sudo salt-call --local state.highstate'

CLISH=sudo salt-cloud -m /etc/salt/cloud.maps.d/linode.conf

cloud_create:
	$(VSSH) '$(CLISH) -P'

cloud_destroy:
	$(VSSH) 'sudo salt-call cloud.destroy slave'
	$(VSSH) 'sudo salt-call cloud.destroy ruler'
# doesnt work	$(VSSH) '$(CLISH) -d -P'

cloud_query:
	$(VSSH) '$(CLISH) -Q -P'

LISHUSER=$(USER)
CLOUD_LOCATION=london
LISH=ssh -t $(LISHUSER)@lish-$(CLOUD_LOCATION).linode.com

CCMD=help

cloud_cmd:
	$(LISH) slave $(CCMD)
	$(LISH) ruler $(CCMD)

destroy: cloud_destroy
	vagrant destroy
