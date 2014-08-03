# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"
  config.vm.box_check_update = false

  config.vm.synced_folder "salt", "/srv/salt"
  config.vm.synced_folder "providers", "/etc/salt/cloud.providers.d"
  config.vm.synced_folder "profiles", "/etc/salt/cloud.profiles.d"
  config.vm.synced_folder "maps", "/etc/salt/cloud.maps.d"

  config.vm.provision :salt do |salt|
    salt.minion_config = "salt/minion"
    salt.run_highstate = true
    salt.verbose = true
    salt.pillar_data
  end

end
