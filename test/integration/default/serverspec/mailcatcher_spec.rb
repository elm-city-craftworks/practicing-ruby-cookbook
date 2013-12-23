require "spec_helper"

describe "practicingruby::_mailcatcher" do
  it "installs mailcatcher gem" do
    expect(package "mailcatcher").to be_installed.by "gem"
  end

  it "enables mailcatcher service" do
    expect(service "mailcatcher").to be_enabled
  end

  it "starts mailcatcher service" do
    expect(command "status mailcatcher").to return_stdout /^mailcatcher start\/running/
  end

  it "starts mailcatcher SMTP server" do
    expect(port 1025).to be_listening
  end

  it "starts mailcatcher HTTP server" do
    expect(port 1080).to be_listening
  end
end
