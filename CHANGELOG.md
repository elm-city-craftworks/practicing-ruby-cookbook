## 1.1.1 (Dec 29 2013)

* Add newline to god config file.
* Tweak SSL file permissions.
* Minor documentation improvements.

## 1.1.0 (Dec 23 2013)

* Add Test Kitchen integration tests.
* Add Foodcritic lint checks.
* Add Rake tasks to run tests.
* Add Travis CI config.
* Install Ruby 2.0.0-p353.

## 1.0.9 (Dec 17 2013)

* Remove obsolete Mixpanel API token.
* Let Vagrant check that vagrant-omnibus is installed.
* Update gem dependencies.

## 1.0.8 (Nov 12 2013)

* Remove `supports` attribute from god service resource, because it is identical
  to defaults.
* Remove `user` attribute from bash resource because it's implicit.

## 1.0.7 (Nov 11 2013)

* Update to mailcatcher cookbook v0.2.0 which starts the service by default.
* Inline god configuration.
* Tweak comments in `Vagrantfile`.

## 1.0.6 (Nov 10 2013)

* Remove action attributes wherever the default action will suffice.
* Use `bash` resource throughout for consistency.
* Always refer to Ruby's File class via `::File`.
* Remove `Berksfile.lock` from version control as a bug in Berkshelf 2.x makes
  this file pretty much useless.

## 1.0.5 (Nov 8 2013)

* Convert God init script into upstart script.

## 1.0.4 (Nov 3 2013)

* Improve documentation a lot. (Thanks, Greg!)
* Add Unicorn upstart script to make sure that Unicorn is started at boot.
* Remove production and development recipes as we only need one default recipe.
* Only create production database.
* Convert God init script from template to file.
* Add `Berksfile.lock` to version control.
* Set `site` in `Berksfile`.

## 1.0.3 (Oct 31 2013)

* Use ruby-build without chruby as we don't need a version manager. This removes
  a lot of complexity from our Ruby setup.
* Install MailCatcher.
* Add guard to only update RubyGems once.
* Nginx recipe: rename `practicingruby_nginx.erb` to `nginx_site.erb`, use local
  variable for domain name.
* Add domain name to `chef.json.example`.

## 1.0.2 (Oct 30 2013)

* Switch to configuring Rails app via environment variables (`.env` file).
* OmniAuth settings are no longer required as the Rails app now runs in OmniAuth
  developer mode.
* Do not require `chef.json` to be present now that the default settings are
  suitable for provisioning a box with no modifications.
* Generate SSL private key and use it to issue self-signed certificate for
  currently configured domain name. Remove SSL-related Chef attributes.
* Fix God's init script so that the service gets started at boot.
* Remove `TODO.md`.

## 1.0.1 (Oct 23 2013)

* Add attribute `node["practicingruby"]["rails"]["host"]` allowing us to set
  Rails host name and Nginx server name to, e.g., `practicingruby.local`.
* Load node attributes and run list from JSON file `chef.log`.
* Fix: Reload Nginx when SSL files have changed.

## 1.0.0 (Oct 22 2013)

* Initial public release.
