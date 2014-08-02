salt-cloud:
  pkgrepo.managed:
    - ppa: saltstack/salt
  pkg.installed:
    - name: salt-cloud
