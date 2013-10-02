Practicing Ruby Cookbook
========================

Sets up environment for [Practicing Ruby Rails app][practicingruby-web].

Requirements
------------

### Platform:

* Ubuntu

### Cookbooks:

* apt
* chruby
* openssl
* postgresql

Attributes
----------

See `attributes/default.rb` for default values.

Recipes
-------

XXX: Update this list

### practicingruby::default

Sets up environment for Practicing Ruby Rails app

### practicingruby::ruby

Installs Ruby and Bundler

Vagrant
-------

With [Vagrant], you can spin up a virtual machine and run this cookbook inside
the VM with Chef Solo. The setup requires to install **Vagrant 1.3.4** or higher
from the [Vagrant downloads page]. You will also need the Vagrant plugins
[vagrant-berkshelf] and [vagrant-omnibus], which you can install this way:

    $ vagrant plugin install vagrant-berkshelf
    $ vagrant plugin install vagrant-omnibus

When everything is in place, this command will boot and provision the VM as
specified in the `Vagrantfile`:

    $ vagrant up

In case the VM is already up, you can run the provisioners again with:

    $ vagrant provision

To SSH into the running VM:

    $ vagrant ssh

Finally, this will stop and destroy the VM:

    $ vagrant destroy -f

License and Author
------------------

Author:: Mathias Lafeldt (<mathias.lafeldt@gmail.com>)

Copyright:: 2013, Mathias Lafeldt

License:: Apache 2.0


[Vagrant downloads page]: http://downloads.vagrantup.com/
[Vagrant]: http://vagrantup.com
[practicingruby-web]: https://github.com/elm-city-craftworks/practicing-ruby-web
[vagrant-berkshelf]: https://github.com/RiotGames/vagrant-berkshelf
[vagrant-omnibus]: https://github.com/schisamo/vagrant-omnibus
