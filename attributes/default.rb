#
# Cookbook Name:: practicingruby
# Attributes:: default
#

# Override default chruby attributes
set["chruby"]["rubies"] = {
  "1.9.3-p392" => false,
  "2.0.0-p247" => true
}
set["chruby"]["default"] = "2.0.0-p247"
