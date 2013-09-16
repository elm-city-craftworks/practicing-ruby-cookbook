# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box      = "precise64"
  config.vm.box_url  = "http://files.vagrantup.com/precise64.box"
  config.vm.hostname = "practicing-ruby"

  # Enable Berkshelf plugin which will make cookbooks available to Vagrant
  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
    chef.add_recipe "apt"
    chef.json = {}
    chef.log_level = :debug
  end
end
