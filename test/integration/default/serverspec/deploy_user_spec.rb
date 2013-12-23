require "spec_helper"

describe "practicingruby::_deploy_user" do
  let(:deploy_user) { user "deploy" }

  it "creates deploy user" do
    expect(deploy_user).to exist
    expect(deploy_user).to have_home_directory "/home/deploy"
  end

  it "installs SSH deploy key" do
    deploy_key = "some-deploy-key"
    expect(deploy_user).to have_authorized_key deploy_key
  end

  it "allows deploy user to run god via sudo" do
    sudoers_file = file "/etc/sudoers.d/deploy"
    expect(sudoers_file).to be_file

    policy = "deploy  ALL=(ALL) NOPASSWD:/usr/local/bin/god"
    expect(sudoers_file).to contain policy
  end
end
