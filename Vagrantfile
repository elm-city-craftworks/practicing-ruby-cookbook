# vi: set ft=ruby :
#
# See https://github.com/mlafeldt/practicingruby-cookbook#vagrant-and-chef-solo
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
  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--memory", 768]
    v.customize ["modifyvm", :id, "--cpus", 1]
  end

  # Install Chef via platform-specific Omnibus package
  config.omnibus.chef_version = "11.6.2"

  # Configure Chef Solo provisioner
  config.vm.provision :chef_solo do |chef|
    # Tell Vagrant where the cookbooks are located
    chef.cookbooks_path = "vendor/cookbooks"

    # Add recipes to be executed in given order
    chef.add_recipe "practicingruby::default"

    # Override some default node attributes
    chef.json = {
      "postgresql" => {
        "password" => {
          "postgres" => "practicingruby"
        }
      },
      "practicingruby" => {
        "deploy" => {
          # For simplicity, use the public key that ships with Vagrant
          "ssh_keys" => ["ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key"]
        }
      }
    }

    # Set Chef log level
    chef.log_level = ENV.fetch("CHEF_LOG", "info").downcase.to_sym
  end
end
