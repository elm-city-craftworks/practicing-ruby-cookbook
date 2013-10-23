1.0.1 (Oct 23 2013)
-------------------

* Add attribute `node["practicingruby"]["rails"]["host"]` allowing us to set
  Rails host name and Nginx server name to, e.g., `practicingruby.local`.
* Load node attributes and run list from JSON file `chef.log`.
* Fix: Reload Nginx when SSL files have changed.

1.0.0 (Oct 22 2013)
-------------------

* Initial public release.
