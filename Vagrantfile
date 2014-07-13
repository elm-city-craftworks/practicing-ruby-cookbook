# vi: set ft=ruby :

def abspath(f)
  File.expand_path("../#{f}", __FILE__)
end

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

  unless ENV["VAGRANT_NO_PLUGINS"]
    # Install Chef using vagrant-omnibus plugin
    config.omnibus.chef_version = "11.12.8"
  end

  # Configure Chef Solo provisioner
  config.vm.provision :chef_solo do |chef|
    # Tell Vagrant where the cookbooks are located
    chef.cookbooks_path = "vendor/cookbooks"

    # Load node attributes and run list from a JSON file
    json_file = if File.exist?(abspath("chef.json"))
                  abspath("chef.json")
                else
                  abspath("chef.json.example")
                end
    chef.json = JSON.parse(IO.read(json_file))

    # Configure Chef output
    chef.formatter = ENV.fetch("CHEF_FORMAT", "null").downcase.to_sym
    chef.log_level = ENV.fetch("CHEF_LOG", "info").downcase.to_sym
  end
end
