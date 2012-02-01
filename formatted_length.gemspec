# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "formatted_length/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "formatted_length"
  s.version     = FormattedLength::VERSION
  s.authors     = ["Meron Bareket"]
  s.email       = ["mrnbrkt@gmail.com"]
  s.homepage    = "http://github.com/mrnbrkt"
  s.summary     = "Adds ability to present integer amount of seconds as text"
  s.description = "Adds formatted_length function to classes that acts_like_formatted_length, converting a length represented in seconds to a string"

  s.rubyforge_project = "formatted_length"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "supermodel"
  s.add_development_dependency "fuubar"
  # s.add_runtime_dependency "rest-client"
end
