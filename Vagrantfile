# vi: set ft=ruby :
#
# This Vagrantfile requires the following Vagrant plugins to be installed:
#
# - vagrant-berkshelf
# - vagrant-omnibus
#
# As the used Vagrant box is a VirtualBox image, VirtualBox is needed as well.
#

Vagrant.configure("2") do |config|
  # VM will be based on Ubuntu 12.04 (64 bit)
  config.vm.box      = "ubuntu-12.04"
  config.vm.box_url  = "http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"

  # Set a nice hostname
  config.vm.hostname = "practicingruby"

  # Assign static IP to VM
  config.vm.network "private_network", :ip => "10.11.12.13"

  # Mirror specs of production system
  config.vm.provider 'virtualbox' do |v|
    v.customize ['modifyvm', :id, '--memory', 768]
    v.customize ['modifyvm', :id, '--cpus', 1]
  end

  # Install latest Chef version via platform-specific Omnibus package
  config.omnibus.chef_version = :latest

  # Use Berkshelf to make all cookbooks in "Berksfile" available to Vagrant
  config.berkshelf.enabled = true

  # HACK: Speed up package download
  config.vm.provision :shell, :inline => "sed -i 's!http://archive.ubuntu.com!http://de.archive.ubuntu.com!g' /etc/apt/sources.list"

  # Configure Chef Solo provisioner
  config.vm.provision :chef_solo do |chef|
    # Add recipes to be executed in given order
    chef.add_recipe "practicingruby"

    # Pass custom JSON data to cookbooks that will be accessible via "node"
    # variable at runtime
    chef.json = {
      "postgresql" => {
        "password" => {
          "postgres" => "practicingruby"
        }
      }
    }

    # Be more chatty
    # chef.log_level = :debug
  end
end
