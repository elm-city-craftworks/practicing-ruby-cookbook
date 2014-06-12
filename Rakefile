require "foodcritic"
require "rubocop/rake_task"

desc "Run RuboCop style and lint checks"
RuboCop::RakeTask.new(:rubocop) do |t|
  t.options = ["-D"]
end

desc "Run Foodcritic lint checks"
FoodCritic::Rake::LintTask.new(:foodcritic) do |t|
  t.options = { :fail_tags => ["any"] }
end

desc "Run all tests"
task :test => [:rubocop, :foodcritic]
task :default => :test

begin
  require "kitchen/rake_tasks"
  Kitchen::RakeTasks.new

  desc "Alias for kitchen:all"
  task :integration => "kitchen:all"

  task :test => :integration
rescue LoadError
  puts ">>>>> Kitchen gem not loaded, omitting tasks" unless ENV['CI']
end

namespace :vagrant do
  def vagrant(*args)
    sh "vagrant", *args
  end

  task :berkshelf do
    require "berkshelf"
    Berkshelf::Berksfile.from_file("Berksfile")
      .install(:path => "vendor/cookbooks")
  end

  desc "Create the Vagrant machine"
  task :create do
    vagrant "up", "--no-provision"
  end

  desc "Provision the Vagrant machine with Chef"
  task :provision => [:berkshelf, :create] do
    vagrant "provision"
  end

  desc "Log into the Vagrant machine via SSH"
  task :login do
    vagrant "ssh"
  end

  desc "Stop and delete the Vagrant machine"
  task :destroy do
    vagrant "destroy", "--force"
  end
end

desc "Alias for vagrant:provision"
task :vagrant => "vagrant:provision"
