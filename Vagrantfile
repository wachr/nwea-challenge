# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "chef/centos-7.0"

  config.vm.box_url = "https://atlas.hashicorp.com/chef/boxes/centos-7.0/versions/1.0.0/providers/virtualbox.box"

  config.vm.network :forwarded_port, guest: 8888, host: 8888

  config.vm.provision :shell, path: 'provision.sh', privileged: true

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file = "nwea-tech-quiz.pp"
  end

end
