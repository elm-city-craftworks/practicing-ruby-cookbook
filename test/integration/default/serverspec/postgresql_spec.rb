require "spec_helper"

describe "practicingruby::_postgresql" do
  let(:postgresql_version) { "9.1" }
  let(:postgresql_port) { 5432 }

  it "installs PostgreSQL server" do
    expect(package "postgresql-#{postgresql_version}").to be_installed
  end

  it "installs PostgreSQL client" do
    expect(package "postgresql-client-#{postgresql_version}").to be_installed
  end

  it "starts PostgreSQL server" do
    output = "Running clusters: #{postgresql_version}/main"
    expect(command "service postgresql status").to return_stdout output
    expect(port postgresql_port).to be_listening
  end

  it "creates database for Rails app" do
    db_name = "practicing-ruby-production"
    expect(command "sudo -u postgres psql -l #{db_name}").to return_exit_status 0
  end
end
