require "spec_helper"

describe "practicingruby::_nginx" do
  let(:nginx_dir) { "/etc/nginx" }
  let(:domain_name) { "practicingruby.local" }

  it "installs Nginx" do
    expect(package "nginx").to be_installed
  end

  it "configures Nginx" do
    config_file = file "#{nginx_dir}/nginx.conf"
    expect(config_file).to be_file
    expect(config_file).to contain(/^[ \t]*worker_processes[ \t]*4;$/)
    expect(config_file).to contain(/^[ \t]*worker_connections[ \t]*768;$/)
  end

  it "starts Nginx server" do
    expect(command "service nginx status").to return_exit_status 0
    expect(port 80).to be_listening
  end

  context "SSL setup" do
    let(:ssl_dir) { "#{nginx_dir}/ssl" }

    it "creates directory to store SSL files" do
      expect(file ssl_dir).to be_directory
      expect(file ssl_dir).to be_owned_by "root"
      expect(file ssl_dir).to be_mode 755
    end

    it "generates RSA private key" do
      key_file = file "#{ssl_dir}/#{domain_name}.key"
      expect(key_file).to be_file
      expect(key_file).to be_owned_by "root"
      expect(key_file).to be_mode 600
      expect(key_file).to contain(/BEGIN RSA PRIVATE KEY/)
    end

    it "issues certificate for domain name" do
      crt_file = file "#{ssl_dir}/#{domain_name}.crt"
      expect(crt_file).to be_file
      expect(crt_file).to be_owned_by "root"
      expect(crt_file).to be_mode 644
      expect(crt_file).to contain(/BEGIN CERTIFICATE/)
    end

    it "deletes certificate signing request" do
      csr_file = file "#{ssl_dir}/#{domain_name}.csr"
      expect(csr_file).to_not be_file
    end
  end

  context "site setup" do
    let(:site_file) { "#{nginx_dir}/sites-available/practicingruby" }

    it "creates practicingruby site config" do
      expect(file site_file).to be_file
      expect(file site_file).to contain(/^[ \t]*server_name #{domain_name} www.#{domain_name};$/)
      expect(file site_file).to contain(/^[ \t]*ssl_certificate[ \t]*ssl\/#{domain_name}.crt;$/)
      expect(file site_file).to contain(/^[ \t]*ssl_certificate_key[ \t]*ssl\/#{domain_name}.key;$/)
    end

    it "enables practicingruby site" do
      symlink = "#{nginx_dir}/sites-enabled/practicingruby"
      expect(file symlink).to be_linked_to site_file
    end

    it "disables default site" do
      symlink = "#{nginx_dir}/sites-enabled/default"
      expect(file symlink).to_not be_file
    end
  end
end
