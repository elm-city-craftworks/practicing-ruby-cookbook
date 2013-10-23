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

This recipe includes the `practicingruby::production` recipe described below.

### practicingruby::production

This recipe sets up a production environment with everything required to deploy
the Practicing Ruby app via Capistrano.

To use the recipe, you must at least override these node attributes with valid
values:

* `node["practicingruby"]["rails"]["omniauth"]["github_key"]`
* `node["practicingruby"]["rails"]["omniauth"]["github_secret"]`

Ideally, you should override these attributes as well:

* `node["practicingruby"]["deploy"]["ssh_keys"]`
* `node["practicingruby"]["ssl"]["certificate"]`
* `node["practicingruby"]["ssl"]["private_key"]`
* `node['postgresql']['password']['postgres']` (for Chef Solo only)

Usage
-----

### Vagrant and Chef Solo

By far the simplest way to get started with the Practicing Ruby cookbook is to
use Vagrant and Chef Solo.

Requirements:

* [VirtualBox] 4.2 or higher - the virtualization provider that runs the Ubuntu
  VM we're going to use
* [Vagrant] 1.3.4 or higher - the command-line tool that makes it super easy to
  spin up a VM and provision it with Chef (as defined in `Vagrantfile`)
* [vagrant-omnibus] - a Vagrant plugin that installs Chef inside the VM; get it
  with `vagrant plugin install vagrant-omnibus`
* [Berkshelf] - a command-line tool to install all cookbooks listed in
  `Berksfile` prior to running Vagrant; get the gem with `bundle install`

If you want to provide custom Chef attributes that should not end up in Git
(e.g. secret tokens), copy `chef.json.example` to `chef.json` and edit the
latter accordingly (in that case, the example file will be ignored).

When everything is in place, run the following two commands inside the
Practicing Ruby cookbook. The first command will install all required Chef
cookbooks to `vendor/cookbooks`, and the second one will run Vagrant to boot the
VM and provision it using those cookbooks:

    $ bundle exec berks install --path vendor/cookbooks
    $ vagrant up --provision

(Note that Vagrant will download the VM image if it's not installed yet.)

In case the VM is already up, you can always run Chef again with:

    $ bundle exec berks install --path vendor/cookbooks
    $ vagrant provision

To SSH into the running VM:

    $ vagrant ssh

Last but not least, here is how to stop and destroy the VM when you no longer
need it or when you want to start from scratch:

    $ vagrant destroy -f

### Capistrano

In order to deploy the Practicing Ruby app to a Vagrant VM that was provisioned
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

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

Contributing
------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


[Berkshelf]: http://berkshelf.com/
[Vagrant]: http://vagrantup.com
[VirtualBox]: https://www.virtualbox.org/
[practicingruby-web]: https://github.com/elm-city-craftworks/practicing-ruby-web
[vagrant-omnibus]: https://github.com/schisamo/vagrant-omnibus
