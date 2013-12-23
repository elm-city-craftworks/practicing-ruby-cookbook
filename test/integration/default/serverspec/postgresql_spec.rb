require "spec_helper"

describe "practicingruby::_postgresql" do
  let(:postgresql_version) { "9.1" }

  it "installs PostgreSQL server" do
    expect(package "postgresql-#{postgresql_version}").to be_installed
  end

  it "installs PostgreSQL client" do
    expect(package "postgresql-client-#{postgresql_version}").to be_installed
  end

  it "starts PostgreSQL server" do
    output = /^Running clusters: #{postgresql_version}\/main/
    expect(command "service postgresql status").to return_stdout output

    expect(port 5432).to be_listening
  end

  it "creates database for Rails app" do
    db_name = "practicing-ruby-production"
    expect(command "sudo -u postgres psql -l").to return_stdout /#{db_name}/
  end
end
