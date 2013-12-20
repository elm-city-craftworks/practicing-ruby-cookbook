require "spec_helper"

describe "practicingruby::_god" do
  it "installs god gem" do
    expect(package "god").to be_installed.by "gem"
  end

  it "creates god config file" do
    config_file = file "/etc/god/master.conf"
    expect(config_file).to be_file

    god_file = "/home/deploy/current/config/delayed_job.god"
    content = /^God.load('#{god_file}') if File.file?('#{god_file}')$/
    expect(config_file).to contain content
  end

  it "creates god startup script" do
    expect(file "/etc/init/god.conf").to be_file
  end

  it "enables god service" do
    expect(service "god").to be_enabled
  end

  it "starts god service" do
    expect(command "status god").to return_stdout /^god start\/running$/
  end
end
