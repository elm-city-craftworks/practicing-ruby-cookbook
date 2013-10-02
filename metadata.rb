name              "practicingruby"
maintainer        "Mathias Lafeldt"
maintainer_email  "mathias.lafeldt@gmail.com"
license           "Apache 2.0"
description       "Sets up environment for Practicing Ruby Rails app"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "1.0.0"
recipe            "practicingruby::default",    "Sets up environment for Practicing Ruby Rails app"
recipe            "practicingruby::ruby",       "Installs Ruby and Bundler"
recipe            "practicingruby::postgresql", "Installs PostgreSQL server and client"

supports "ubuntu"

depends "apt"
depends "chruby"
depends "postgresql"
