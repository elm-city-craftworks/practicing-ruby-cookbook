# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box      = "ubuntu-12.04"
  config.vm.box_url  = "http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.hostname = "practicingruby"

  # Enable Berkshelf plugin which will make cookbooks available to Vagrant
  config.berkshelf.enabled = true

  # Install Chef version 11
  config.vm.provision :shell, :inline => <<EOS
set -e
if ! command -V chef-solo >/dev/null 2>/dev/null; then
  curl -L https://www.opscode.com/chef/install.sh | bash -s -- -v 11.6.0
fi
EOS

  config.vm.provision :chef_solo do |chef|
    chef.add_recipe "apt"
    chef.add_recipe "practicingruby"
    chef.json = {}
    chef.log_level = :debug
  end
end
