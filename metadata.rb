name              "practicing-ruby"
maintainer        "Mathias Lafeldt"
maintainer_email  "mathias.lafeldt@gmail.com"
license           "Apache 2.0"
description       "Sets up environment for Practicing Ruby Rails app"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "1.0.0"
recipe            "practicing-ruby::default", "Sets up environment for Practicing Ruby Rails app"

supports "ubuntu"
