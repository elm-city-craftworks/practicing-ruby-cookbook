Practicing Ruby Cookbook
========================

This Chef cookbook fully automates the process of setting up an environment that
can run the [Practicing Ruby Rails app][practicingruby-web]. It takes a bare
Ubuntu system from zero to the point where Practicing Ruby can be deployed with
Capistrano.

Requirements
------------

### Chef

The following Chef versions have been tested with this cookbook:

* Chef 11.6.x (Omnibus install)

### Platform

The following platforms have been tested with this cookbook:

* Ubuntu 12.04 LTS (Precise Pangolin)

### Cookbooks

External cookbook dependencies:

* [apt](https://github.com/opscode-cookbooks/apt)
* [chruby](https://github.com/Atalanta/chef-chruby)
* [database](https://github.com/opscode-cookbooks/database)
* [nginx](https://github.com/opscode-cookbooks/nginx)
* [postgresql](https://github.com/opscode-cookbooks/postgresql)
* [sudo](https://github.com/opscode-cookbooks/sudo)
* [user](https://github.com/fnichol/chef-user)

Attributes
----------

See `attributes/default.rb` for a list of all configurable Chef attributes and
their default values.

Recipes
-------

### practicingruby::default

The default recipe sets up everything required to deploy the Practicing Ruby app
with Capistrano. To use it, you must at least override these node attributes
with valid values:

* `node["practicingruby"]["rails"]["omniauth"]["github_key"]`
* `node["practicingruby"]["rails"]["omniauth"]["github_secret"]`

Ideally, you should override these attributes as well:

* `node["practicingruby"]["deploy"]["ssh_keys"]`
* `node["practicingruby"]["ssl"]["certificate"]`
* `node["practicingruby"]["ssl"]["private_key"]`
* `node['postgresql']['password']['postgres']` (for Chef Solo only)

Vagrant
-------

With [Vagrant], you can spin up a virtual machine and run this cookbook inside
the VM with Chef Solo. The setup requires to install **Vagrant 1.3.4** or higher
from the [Vagrant downloads page]. You will also need the Vagrant plugin
[vagrant-omnibus], which you can install this way:

    $ vagrant plugin install vagrant-omnibus

Furthermore, [Berkshelf] is used to set up the cookbook and its dependencies
prior to running Vagrant. Install the Berkshelf gem with `bundle install` and
then run:

    $ bundle exec berks install --path vendor/cookbooks

When everything is in place, this command will boot and provision the VM as
specified in the `Vagrantfile`:

    $ vagrant up

In case the VM is already up, you can run the provisioners again with:

    $ vagrant provision

To SSH into the running VM:

    $ vagrant ssh

Finally, this will stop and destroy the VM:

    $ vagrant destroy -f

Capistrano
----------

In order to deploy the Practicing Ruby app to a Vagrant VM that was configured
with the Practicing Ruby cookbook, you have to add the following settings to
your `~/.ssh/config` file (you might have to adapt `HostName` and `IdentityFile`
to match your setup).

```
Host practicingruby.local
    HostName 10.11.12.13
    User vagrant
    UserKnownHostsFile /dev/null
    StrictHostKeyChecking no
    PasswordAuthentication no
    IdentityFile ~/.vagrant.d/insecure_private_key
    IdentitiesOnly yes
```

Afterwards, you will be able to deploy the Rails app with Capistrano:

    $ cd /path/to/practicing-ruby-web
    $ bundle install
    $ bundle exec cap vagrant deploy:setup deploy

Also, you will be able to log into the VM via `ssh practicingruby.local`.

License and Author
------------------

Author:: Mathias Lafeldt (<mathias.lafeldt@gmail.com>)

Copyright:: 2013, Mathias Lafeldt

License:: Apache 2.0


[Berkshelf]: http://berkshelf.com/
[Vagrant downloads page]: http://downloads.vagrantup.com/
[Vagrant]: http://vagrantup.com
[practicingruby-web]: https://github.com/elm-city-craftworks/practicing-ruby-web
[vagrant-omnibus]: https://github.com/schisamo/vagrant-omnibus
