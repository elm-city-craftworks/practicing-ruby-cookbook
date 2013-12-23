require "spec_helper"

describe "practicingruby::_rails" do
  let(:shared_dir) { "/home/deploy/shared" }

  it "installs JavaScript runtime" do
    expect(package "nodejs").to be_installed
  end

  it "installs Pygments for syntax highlighting" do
    expect(package "nodejs").to be_installed
  end

  it "creates shared directory for Rails app" do
    expect(file shared_dir).to be_directory
    expect(file shared_dir).to be_owned_by "deploy"
    expect(file shared_dir).to be_mode 2775
  end

  it "creates environment configuration for Rails app" do
    config_file = file "#{shared_dir}/.env"

    expect(config_file).to be_file
    expect(config_file).to be_owned_by "deploy"
    expect(config_file).to be_mode 644

    expect(config_file).to contain "HOST=practicingruby.local"
  end

  it "creates database configuration for Rails app" do
    config_file = file "#{shared_dir}/database.yml"

    expect(config_file).to be_file
    expect(config_file).to be_owned_by "deploy"
    expect(config_file).to be_mode 644

    expect(config_file).to contain "database: practicing-ruby-production"
  end
end
