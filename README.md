Practicing Ruby Cookbook
========================

This Chef cookbook fully automates the process of setting up an environment that
can run the [Practicing Ruby Rails app][pr-web]. It takes a bare Ubuntu system
from zero to the point where Practicing Ruby can be deployed with Capistrano.

The cookbook was originally built for the Practicing Ruby article
["Infrastructure automation by example"][pr-article].

## Requirements

To use this cookbook, you need the following software:

* [VirtualBox] - Version 4.2 or higher
* [Vagrant] - Version 1.3.4 or higher
* [vagrant-omnibus] - installable via `vagrant plugin install vagrant-omnibus`
* [Berkshelf] - installable via `bundle install`

When you provision a VM using this cookbook, Chef will be installed for you via
`vagrant-omnibus`, and if necessary an Ubuntu Linux base system image will be
downloaded automatically. See the project's `Vagrantfile` for exact versions
used.

## External Cookbooks

Our recipes are built on top of the following external cookbooks: 

* [apt](https://github.com/opscode-cookbooks/apt)
* [database](https://github.com/opscode-cookbooks/database)
* [mailcatcher](https://github.com/andruby/mailcatcher)
* [nginx](https://github.com/opscode-cookbooks/nginx)
* [postgresql](https://github.com/opscode-cookbooks/postgresql)
* [sudo](https://github.com/opscode-cookbooks/sudo)
* [user](https://github.com/fnichol/chef-user)

All of these will be automatically installed by **Berkshelf**, so there is no
need to set them up manually.

## Configuration

Most of the web application's features will work without modifying any settings,
but a few features do need to have valid API keys or other bits of configuration
data to be set in order to run. To see what options are configurable, see
`attributes/default.rb`. To override them, copy `chef.json.example` to
`chef.json` and edit the latter accordingly. *Keep in mind that for many use
cases, you may not need to override any settings at all.*

## Provisioning

Run the following two commands inside the Practicing Ruby cookbook to create a
Vagrant machine and boot it up:

    $ bundle exec berks vendor vendor/cookbooks
    $ vagrant up --provision

In case the VM is already up, you can always run Chef again with:

    $ bundle exec berks vendor vendor/cookbooks
    $ vagrant provision

To SSH into the running VM:

    $ vagrant ssh

Last but not least, here is how to stop and destroy the VM when you no longer
need it or when you want to start from scratch:

    $ vagrant destroy -f

### Using Rake

Instead of running Vagrant directly on the command line, there is also a Rake
task you can use. With this command, you always end up with a Vagrant machine
that is fully provisioned:

    $ bundle exec rake provision

## Deploying

In order to deploy the Practicing Ruby app to a Vagrant VM that was provisioned
with the Practicing Ruby cookbook, you have to add the following settings to
your `~/.ssh/config` file (you might have to adapt `HostName` and `IdentityFile`
to match your setup).

```
Host practicingruby.local
    HostName 10.11.12.13
    User deploy
    UserKnownHostsFile /dev/null
    StrictHostKeyChecking no
    PasswordAuthentication no
    IdentityFile ~/.vagrant.d/insecure_private_key
    IdentitiesOnly yes
```

Afterwards, you will be able to deploy the Rails app with Capistrano:

    $ cd /path/to/practicing-ruby-web
    $ bundle install
    $ bundle exec cap vagrant deploy:setup deploy seed

Also, you will be able to log into the VM via `ssh practicingruby.local`.

To visit the site from your browser, you'll probably also need to add the
following entries to your `/etc/hosts` file:

```
10.11.12.13 practicingruby.local
10.11.12.13 www.practicingruby.local
```

A few users and some articles will already be populated in the DB. Try logging
in as `admin` for an administrator account, and see the [full seed file][pr-seeds]
for all created users.

### Using Rake

Instead of manually switching to the `practicing-ruby-web` directory and running
Capistrano, you can also use this handy Rake task to deploy the Rails app to the
Vagrant machine:

    $ bundle exec rake deploy

## Testing

[![Build Status](https://travis-ci.org/elm-city-craftworks/practicing-ruby-cookbook.svg?branch=master)](https://travis-ci.org/elm-city-craftworks/practicing-ruby-cookbook)

The following Rake tasks are provided for automated testing of the cookbook:

* `rake rubocop` - Run [RuboCop] style and lint checks
* `rake foodcritic` - Run [Foodcritic] lint checks
* `rake integration` - Run [Test Kitchen] integration tests (provisions a
  Vagrant VM using this cookbook and then tests the infrastructure with
  [Serverspec])
* `rake test` - Run all tests

## License and Authorship

Originally written in October 2013 by Mathias Lafeldt (<mathias.lafeldt@gmail.com>),
with contributions from the community. Individual contributors retain their
copyright, but agree to release the code under the same license as the project
itself. For a complete list of contributors, see the git logs or visit:
https://github.com/elm-city-craftworks/practicing-ruby-cookbook/graphs/contributors

Licensed under the Apache License, Version 2.0 (the "License"); you may not use
this file except in compliance with the License. You may obtain a copy of the
License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed
under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
CONDITIONS OF ANY KIND, either express or implied. See the License for the
specific language governing permissions and limitations under the License.

## Contributing

We welcome contributed improvements and bug fixes via the usual workflow:

1. Fork this repository
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new pull request


[Berkshelf]: http://berkshelf.com/
[Foodcritic]: http://www.foodcritic.io/
[pr-article]: https://practicingruby.com/articles/infrastructure-automation
[pr-seeds]: https://github.com/elm-city-craftworks/practicing-ruby-web/blob/master/db/seeds.rb
[pr-web]: https://github.com/elm-city-craftworks/practicing-ruby-web
[RuboCop]: https://github.com/bbatsov/rubocop
[Serverspec]: http://serverspec.org/
[Test Kitchen]: http://kitchen.ci/
[vagrant-omnibus]: https://github.com/schisamo/vagrant-omnibus
[Vagrant]: http://vagrantup.com
[VirtualBox]: https://www.virtualbox.org/
