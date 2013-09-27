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

  # Allow accessing port 8080 on the guest via port 8081 on the host
  config.vm.network "forwarded_port", :guest => 8080, :host => 8081

  # Install latest Chef version via platform-specific Omnibus package
  config.omnibus.chef_version = :latest

  # Use Berkshelf to make all cookbooks in "Berksfile" available to Vagrant
  config.berkshelf.enabled = true

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
    chef.log_level = :debug
  end
end
