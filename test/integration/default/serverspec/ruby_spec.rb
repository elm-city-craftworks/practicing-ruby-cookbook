require "spec_helper"

describe "practicingruby::_ruby" do
  let(:ruby_version) { "2.0" }

  it "installs correct version of Ruby" do
    expect(package "ruby#{ruby_version}").to be_installed
  end

  it "uses correct version of Ruby" do
    expect(command "ruby --version").to return_stdout(/^ruby #{ruby_version}/)
  end

  it "configures RubyGems to not install gem docs" do
    expect(file "/etc/gemrc").to contain(/^gem: --no-document$/)
  end

  it "installs Bundler" do
    expect(package "bundler").to be_installed.by "gem"
  end
end
