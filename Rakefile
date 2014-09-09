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

desc "Provision Vagrant machine with Chef"
task :provision do
  require "berkshelf"
  rm_rf "vendor/cookbooks"
  Berkshelf::Berksfile.from_file("Berksfile").vendor("vendor/cookbooks")
  sh "vagrant", "up", "--no-provision"
  sh "vagrant", "provision"
end

desc "Deploy Rails app to Vagrant machine"
task :deploy do
  Bundler.with_clean_env do
    cd "../practicing-ruby-web" do
      sh "bundle", "install", "--quiet"
      sh "bundle", "exec", "cap", "vagrant", "deploy:setup", "deploy", "seed"
    end
  end
end
