# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "strapless/version"

Gem::Specification.new do |s|
  s.name        = "strapless"
  s.version     = Strapless::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jeff Rafter"]
  s.email       = ["jeffrafter@gmail.com"]
  s.homepage    = "http://github.com/jeffrafter/strapless"
  s.summary     = %q{Simple tasks for bootstrapping the data in your rails application}
  s.description = %q{To create seed data based on your development database? Run the dump tasks, commit the files, and on the next machine run the laod tasks.}

  s.rubyforge_project = "strapless"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
