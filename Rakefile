require 'bundler'
Bundler::GemHelper.install_tasks
=begin
require 'rake/testtask'
Rake::TestTask.new(:test => ["generator:cleanup", "generator:simple_admin"]) do |task|
  task.libs << "lib" << "test"
  task.pattern = "test/**/*_test.rb"
  task.verbose = true
end

generators = %w(simple_admin)

namespace :generator do
  desc "Cleans up the test app before running the generator"
  task :cleanup do
    FileUtils.rm_rf("test/rails")
    system "cd test && rails new rails"

    # I don't like testing performance!
    FileUtils.rm_rf("test/rails/test/performance")

#    system "echo \"\" >> test/rails/config/environments/test.rb"
#    system "echo \"config.gem 'thoughtbot-shoulda', :lib => 'shoulda'\" >> test/rails/config/environments/test.rb"
#    system "echo \"config.gem 'thoughtbot-factory_girl', :lib => 'factory_girl'\" >> test/rails/config/environments/test.rb"

    # Make a thing
    system "cd test/rails && rails generate scaffold thing name:string mood:string"

    FileUtils.mkdir_p("test/rails/vendor/plugins")
    spreadhead_root = File.expand_path(File.dirname(__FILE__))
    system("ln -s #{simple_admin_root} test/rails/vendor/plugins/simple_admin_root")
  end

  desc "Prepares the application with an alternate database"
  task :database do
    puts "==  Configuring the database =================================================="
    system "cp config/database.yml.sample test/rails/config/database.yml"
    system "cd test/rails && rake db:migrate:reset"
  end

  desc "Run the simple_admin generator"
  task :simple_admin do
    system "cd test/rails && rails generate simple_admin && rake db:migrate db:test:prepare"
  end

end

task :default => :test
=end
