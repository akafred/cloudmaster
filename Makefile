
default: reload provision

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
	$(VSSH) '$(CLISH) -d'

cloud_query:
	$(VSSH) '$(CLISH) -Q'

LISHUSER=$(USER)
CLOUD_LOCATION=london
LISH=ssh -t $(LISHUSER)@lish-$(CLOUD_LOCATION).linode.com

CCMD=help

cloud_cmd:
	$(LISH) slave $(CCMD)
	$(LISH) ruler $(CCMD)

