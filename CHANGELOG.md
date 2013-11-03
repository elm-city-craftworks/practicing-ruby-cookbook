1.0.4 (Nov 3 2013)
------------------

* Improve documentation a lot. (Thanks, Greg!)
* Add Unicorn upstart script to make sure that Unicorn is started at boot.
* Remove production and development recipes as we only need one default recipe.
* Only create production database.
* Convert God init script from template to file.
* Add `Berksfile.lock` to version control.
* Set `site` in `Berksfile`.

1.0.3 (Oct 31 2013)
-------------------

* Use ruby-build without chruby as we don't need a version manager. This removes
  a lot of complexity from our Ruby setup.
* Install MailCatcher.
* Add guard to only update RubyGems once.
* Nginx recipe: rename `practicingruby_nginx.erb` to `nginx_site.erb`, use local
  variable for domain name.
* Add domain name to `chef.json.example`.

1.0.2 (Oct 30 2013)
-------------------

* Switch to configuring Rails app via environment variables (`.env` file).
* OmniAuth settings are no longer required as the Rails app now runs in OmniAuth
  developer mode.
* Do not require `chef.json` to be present now that the default settings are
  suitable for provisioning a box with no modifications.
* Generate SSL private key and use it to issue self-signed certificate for
  currently configured domain name. Remove SSL-related Chef attributes.
* Fix God's init script so that the service gets started at boot.
* Remove `TODO.md`.

1.0.1 (Oct 23 2013)
-------------------

* Add attribute `node["practicingruby"]["rails"]["host"]` allowing us to set
  Rails host name and Nginx server name to, e.g., `practicingruby.local`.
* Load node attributes and run list from JSON file `chef.log`.
* Fix: Reload Nginx when SSL files have changed.

1.0.0 (Oct 22 2013)
-------------------

* Initial public release.
