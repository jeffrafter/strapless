namespace :db do

  # Loosely based on ar_fixtures, but with to_param support and some fixups
  class ActiveRecord::Base
    def self.dump_fixtures(path=nil)
      path ||= File.expand_path("db/data/defaults/#{table_name}.yml", Rails.root)
      path = File.join(path, "#{table_name}.yml") if File.directory?(path)
      puts "Dumping fixtures: #{path}"
      file = File.open(path, "w")
      file.puts(self.find(:all).inject({}) { |hash, record|
        hash.merge(record.fixture_name => record.attributes)
      }.to_yaml(:SortKeys => true))
      file.close
    end

    def fixture_name
      n = "#{self.class.table_name.singularize}_#{'%05i' % to_param rescue to_param}"
      n = n.downcase
      n = n.gsub(/(\s|-|\/)/, '_')
      n = n.gsub(/__/, '_')
      n = n.gsub(/[^a-z0-9_]/, '')
    end
  end

  namespace :bootstrap do
    desc "Create a set of fixtures from the specified table (or all)"
    task :dump, [:table] => [:environment] do |t, args|
      unless args[:table]
        puts "You must indicate which tables you want to make fixtures for. If you want to make fixtures for all, use rake db:bootstrap:dump[all]"
        exit
      end
      require 'active_record/fixtures'
      data = File.join(Rails.root, 'db', 'data')
      Dir.mkdir(data) unless File.exists?(data)
      Dir['app/models/*'].each {|f| require f }
      ActiveRecord::Base.descendants.select{|m| m.table_exists? && (m.table_name == args[:table] || args[:table] == 'all') }.each do |klass|
        klass.dump_fixtures(data)
      end
    end

    # Task is based on mephisto's bootstrap, by Rick Olson
    desc "Load initial fixtures (from db/data/*.yml) into the current database (or all)"
    task :load, [:table] => [:environment] do |t, args|
      require 'active_record/fixtures'
      unless args[:table]
        puts "You must indicate the table name for the fixtures that you want to load into your database. The fixture data will overwrite all current data in the table. If you want to load all fixtures, use db:bootstrap:load[all]"
        exit
      end
      Dir.glob(File.join(Rails.root, 'db', 'data', '*.yml')).each do |fixture_file|
        if File.basename(fixture_file, '.*') == args[:table] || args[:table] == 'all'
          puts 'Loading fixture: ' + fixture_file
          Fixtures.create_fixtures("db/data", File.basename(fixture_file, '.*'))
        end
      end
    end
  end
end
