# vi: set ft=ruby :
#
# See documentation of Vagrant and Chef Solo at
# https://github.com/elm-city-craftworks/practicing-ruby-cookbook#vagrant-and-chef-solo
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

    # Load node attributes and run list from a JSON file
    json_file = "chef.json"
    abort "error: #{json_file} not found!" unless File.exist?(json_file)
    chef.json = JSON.parse(IO.read(json_file))

    # Set Chef log level
    chef.log_level = ENV.fetch("CHEF_LOG", "info").downcase.to_sym
  end
end
