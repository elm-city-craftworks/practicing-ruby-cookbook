require "spec_helper"

describe "practicingruby::_unicorn" do
  it "creates unicorn startup script" do
    startup_file = file "/etc/init/unicorn.conf"
    expect(startup_file).to be_file

    deploy_user = "deploy"
    deploy_dir = "/home/#{deploy_user}/current"
    expect(startup_file).to contain(/^setuid #{deploy_user}$/)
    expect(startup_file).to contain(/^env DEPLOY_DIR=#{deploy_dir}$/)
  end

  it "enables unicorn service" do
    expect(service "unicorn").to be_enabled
  end
end
