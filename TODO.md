Documentation
-------------

* Document how to register a new GitHub application to enable login via OAuth.
* Document how to get started with the Rails app, e.g. create a new user/admin.
* Document Chef attributes in `metadata.rb`.

Testing
-------

* Add ChefSpec unit tests.

Misc
----

* Create and use dedicated postgresql user.
* Consider storing sensitive information in Chef data bags:
  http://docs.opscode.com/chef/essentials_data_bags.html
* Consider using https://github.com/sj26/mailcatcher to handle emails.
* Make sure that God and Unicorn are restarted on reboot.
