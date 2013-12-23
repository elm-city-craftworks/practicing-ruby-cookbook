require "spec_helper"

describe "practicingruby::_ruby" do
  let(:prefix_path) { "/usr/local" }

  it "installs ruby-build" do
    expect(command "#{prefix_path}/bin/ruby-build --version").to return_exit_status 0
  end

  it "installs correct version of Ruby" do
    ruby_version = "2.0.0p353"
    expect(command "#{prefix_path}/bin/ruby --version").to return_stdout /^ruby #{ruby_version}/
  end

  it "updates rubygems" do
    expect(package "rubygems-update").to be_installed.by "gem"
  end

  it "installs bundler gem" do
    expect(package "bundler").to be_installed.by "gem"
  end
end
