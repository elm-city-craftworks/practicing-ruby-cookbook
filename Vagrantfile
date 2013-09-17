# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box      = "ubuntu-12.04"
  config.vm.box_url  = "http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.hostname = "practicing-ruby"

  # Enable Berkshelf plugin which will make cookbooks available to Vagrant
  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
    chef.add_recipe "apt"
    chef.add_recipe "practicing-ruby::ruby"
    chef.json = {}
    chef.log_level = :debug
  end
end
