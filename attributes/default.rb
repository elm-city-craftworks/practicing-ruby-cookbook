#
# Cookbook Name:: practicingruby
# Attributes:: default
#

# Ruby version to install
default["practicingruby"]["ruby"]["version"]        = "2.0.0-p247"

# Defaults for gem_package resource
default["practicingruby"]["ruby"]["gem"]["binary"]  = "/opt/rubies/#{node["practicingruby"]["ruby"]["version"]}/bin/gem"
default["practicingruby"]["ruby"]["gem"]["options"] = "--no-ri --no-rdoc"

# Databases to create

default["practicingruby"]["databases"] = {
  "practicing-ruby-development" => true,
  "practicing-ruby-test"        => true,
  "practicing-ruby-production"  => true,
}

default["practicingruby"]["database"]["practicing-ruby-development"] = {
  "environment" => "development",
  "adapter"     => "postgresql",
  "host"        => "localhost",
  "username"    => "postgres",
  "password"    => "practicingruby",
}

default["practicingruby"]["database"]["practicing-ruby-test"] = {
  "environment" => "test",
  "adapter"     => "postgresql",
  "host"        => "localhost",
  "username"    => "postgres",
  "password"    => "practicingruby",
}

default["practicingruby"]["database"]["practicing-ruby-production"] = {
  "environment" => "production",
  "adapter"     => "postgresql",
  "host"        => "localhost",
  "username"    => "postgres",
  "password"    => "practicingruby",
}

# Deployment user for Capistrano

default["practicingruby"]["deploy"]["username"]      = "deploy"
default["practicingruby"]["deploy"]["ssh_keys"]      = []
default["practicingruby"]["deploy"]["sudo_commands"] = ["/usr/local/bin/god"]
default["practicingruby"]["deploy"]["home_dir"]      = "/home/#{node["practicingruby"]["deploy"]["username"]}"

# Rails app settings

default["practicingruby"]["rails"]["auth"]["mode"]              = "developer"

default["practicingruby"]["rails"]["smtp"]["address"]           = "localhost"
default["practicingruby"]["rails"]["smtp"]["port"]              = 1025

default["practicingruby"]["rails"]["secret_token"]              = "3f8e352c942d04b489795f5a9fe464c0"
default["practicingruby"]["rails"]["host"]                      = "practicingruby.local"

default["practicingruby"]["rails"]["cachecooker"]["base_uri"]   = "http://practicingruby.local"
default["practicingruby"]["rails"]["cachecooker"]["password"]   = "supersecret"
default["practicingruby"]["rails"]["cachecooker"]["realm"]      = "Practicing Ruby"
default["practicingruby"]["rails"]["cachecooker"]["username"]   = "cachecooker"

default["practicingruby"]["rails"]["mailchimp"]["api_key"]      = "YOUR-API-KEY"
default["practicingruby"]["rails"]["mailchimp"]["list_id"]      = "YOUR-LIST-ID"
default["practicingruby"]["rails"]["mailchimp"]["sender_email"] = "Your Sender Email"
default["practicingruby"]["rails"]["mailchimp"]["sender_name"]  = "Your Sender Name"
default["practicingruby"]["rails"]["mailchimp"]["testers"]      = ["your@email.com"]
default["practicingruby"]["rails"]["mailchimp"]["webhook_key"]  = "Your/webhook/key"

default["practicingruby"]["rails"]["mixpanel"]["api_token"]     = "..."

default["practicingruby"]["rails"]["stripe"]["publishable_key"] = "PUBLISHABLE"
default["practicingruby"]["rails"]["stripe"]["secret_key"]      = "SECRET"
default["practicingruby"]["rails"]["stripe"]["webhook_path"]    = "/oh/yeah/stripe/webhooks"


# Self-signed SSL certificate
default["practicingruby"]["ssl"]["certificate_file"] = "#{node["nginx"]["dir"]}/practicingruby.crt"
default["practicingruby"]["ssl"]["certificate"] = <<EOS
-----BEGIN CERTIFICATE-----
MIIDRDCCAiwCCQCJQO0UpFm6hzANBgkqhkiG9w0BAQUFADBkMQswCQYDVQQGEwJV
UzETMBEGA1UECAwKU29tZS1TdGF0ZTEhMB8GA1UECgwYSW50ZXJuZXQgV2lkZ2l0
cyBQdHkgTHRkMR0wGwYDVQQDDBRwcmFjdGljaW5ncnVieS5sb2NhbDAeFw0xMzEw
MjIyMjEwMzBaFw0xODEwMjEyMjEwMzBaMGQxCzAJBgNVBAYTAlVTMRMwEQYDVQQI
DApTb21lLVN0YXRlMSEwHwYDVQQKDBhJbnRlcm5ldCBXaWRnaXRzIFB0eSBMdGQx
HTAbBgNVBAMMFHByYWN0aWNpbmdydWJ5LmxvY2FsMIIBIjANBgkqhkiG9w0BAQEF
AAOCAQ8AMIIBCgKCAQEAnpQTlynzhP7YmuftZ/s8ag1yLXN/Z3SGi3buTXvyLCw5
9vEsX2CiakAP2GysAGMwzK0f98+rOFk+QxkNhjl57FbRqV0PWWQpmsJ2BqfMWDIX
uj5Bs2lm8MP/vCGE40nzIsk16HxV1zh7M/ZSANTf0zURJl/ZxSG3/Ml44a61PTyd
eb19Uz/ClEwn/8SW20ZK87WhVIucti1EnbeLkdFlY5911l/OTAYbe+s+Bv8lRo0z
gAfStgDShWrxxThDf7wXzIBzu7TXphsLVycdOrWCa0r9rJwSrztlc+APZsWHhBeF
gIhlhy1kgFrDGrMrTa/3OQaXKzrpIixpsTIvJlzc5wIDAQABMA0GCSqGSIb3DQEB
BQUAA4IBAQBwOB0Np3WJrW3fUgQPDdzCAeYGQopHazUatqJbsKlyUl1s9VlpAZWP
n/FDH7BbFk5R61TKIVP5ezA7lqVT3kUpMc8a2UIeda4AQNPpLCdJGU/FLEgF6EOV
e0QOOO5lEVkbHSjwi2aRUYab/3mLH9dUiBPSGQE5rnrPyp4BPpsOKGNuuW40eh6I
Pa6Ow6KNXC0BFM31xUvdvTBkG11bt4OPqRuvLvNvCb6LSMvO6Y225418reCiJTFP
E+GPAAHJJKWyz8qCwSjGposEKb3F6wycB4TKI/HgDxZSsl5DtgTln4LdiXx6pjII
z2v2woaxgQ/qb71kW4oHpgJr90Qvx+vF
-----END CERTIFICATE-----
EOS

# SSL private key
default["practicingruby"]["ssl"]["private_key_file"] = "#{node["nginx"]["dir"]}/practicingruby.key"
default["practicingruby"]["ssl"]["private_key"] = <<EOS
-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEAnpQTlynzhP7YmuftZ/s8ag1yLXN/Z3SGi3buTXvyLCw59vEs
X2CiakAP2GysAGMwzK0f98+rOFk+QxkNhjl57FbRqV0PWWQpmsJ2BqfMWDIXuj5B
s2lm8MP/vCGE40nzIsk16HxV1zh7M/ZSANTf0zURJl/ZxSG3/Ml44a61PTydeb19
Uz/ClEwn/8SW20ZK87WhVIucti1EnbeLkdFlY5911l/OTAYbe+s+Bv8lRo0zgAfS
tgDShWrxxThDf7wXzIBzu7TXphsLVycdOrWCa0r9rJwSrztlc+APZsWHhBeFgIhl
hy1kgFrDGrMrTa/3OQaXKzrpIixpsTIvJlzc5wIDAQABAoIBACn2SRDRGw1wWmTz
RlEjnCL8F+CLFYWMwiWZfQmn6LdjpJsBypoaeh/ff9HnP8SCeuFOVo0+uLIae21J
7dg80VSGzMgiRfODm7bGCnFMabhU2Q6BduVA2OqREtT3kbCLWvkzgT5Z2GUxHvjr
D1wE+I1tF3KuHnQZrhQIRCKEFpVzUBvZNPix3vh/JSxKNiJ9GeynexA4jzPa55LU
WH2CLZEJBg8LyWHNSJ7wbvzFz3oatArxp1WNzrwuD6Qr1TBvbpz17TxVGd1cL5Ct
BoUNk4dSs2BS+3uSS2SS7O5wm921IqVCjEWKoZTUNuM+UREbA0VOuB7WwiQuM2eS
QlqgGiECgYEAzEIGewQ3CHyXtIboR+nXmjOClt9zsXZbswbuSgmCHtXmdO7RjyH4
KOUWlY2SZ2Pp8wRj5i//w8oI8s/KD/aZjKDtjFE6dyV22iJ0ex9y3VbuW8FdVy+S
R2E8HDca5M4xBpWIaMF6XaojIQTP6oNT6L4tzcOKUSjzGW/4NhPfBa8CgYEAxr/F
KxUYnZjH4e25dtG8NqyEDtxfdp/jHT1y2aQFxnY+HBhFpEJuZTJnr+0OrPChGDA2
NbHjlrBURSIT/H/ihVGXp4XXbskA0uyIfDn2q/mNCoGanO7331oGJy/SKc5rdx4t
KmKTLv86j2euGxjkNt0Sg5aH7M+Pln66sobtIkkCgYEAmiaqJWUE8460HzZBTySX
5nRBdgOlmKSuh+oPJCkQ3pynlFA4L0F/u71I0g1KFGU/RnxluG85I1Xycu2GnY2K
TKuXG3KiIRFRJUcjiVgupATbVrwT6ZypVN15NAISdeN29HUdwZFi/BVO9bhgAaij
Rt9gSg3s8VtqPCRYutc8VVkCgYAf2T85Rioppv/w3m1n8vgcMsz+rKXHlpuIZf5v
je82/F+7lNAkIFkcclVXRb+iSvUlsSQeuqDj1uHKKknVnpCoGIka2UHKiP9OzYSZ
k5hJurW1R0uFdm3WJtDxmqIs/N0Pu5A1SJKZZ2D09gJaaUS43fhHienCMwipbylv
zltVsQKBgQCf44uzYGB0Ib9lltgXAR9gecbXDqsx9RIxkv9NuTHzvE98W1NUe2ta
fiAm5MPAueoPMa9M9BDsuqu2lmNNobF5z7VfncYLqE5J00wz4ABzLF1uhlk3kmYi
kA5BpRHuBwIsQGQlbkf09z1ygdzzVDGzQygZhvUZ+vpuKaiOaOLlYA==
-----END RSA PRIVATE KEY-----
EOS
