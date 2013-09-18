Practicing Ruby Cookbook
========================

Sets up environment for [Practicing Ruby Rails app][practicingruby-web].

Requirements
------------

### Platform:

* Ubuntu

### Cookbooks:

* [rbenv](https://github.com/fnichol/chef-rbenv)
* [ruby_build](https://github.com/fnichol/chef-ruby_build)

Attributes
----------

* `node["practicingruby"]["ruby"]["version"]` - Ruby version to install
* `node["practicingruby"]["ruby"]["gems"]` - List of Ruby gems to install

See `attributes/default.rb` for default values.

Recipes
-------

### practicingruby::default

Sets up environment for Practicing Ruby Rails app

### practicingruby::ruby

Installs Ruby and gems

License and Author
------------------

Author:: Mathias Lafeldt (<mathias.lafeldt@gmail.com>)

Copyright:: 2013, Mathias Lafeldt

License:: Apache 2.0


[practicingruby-web]: https://github.com/elm-city-craftworks/practicing-ruby-web
