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

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1.0"

  s.add_development_dependency "sqlite3"
end
