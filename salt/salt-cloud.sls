salt-cloud:
  pkgrepo.managed:
    - ppa: saltstack/salt
  pkg.installed:
    - name: salt-cloud

linode-requirement:
  pkg.installed:
    - name: python-libcloud
