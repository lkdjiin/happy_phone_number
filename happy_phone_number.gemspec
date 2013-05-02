$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "happy_phone_number/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "happy_phone_number"
  s.version     = HappyPhoneNumber::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of HappyPhoneNumber."
  s.description = "TODO: Description of HappyPhoneNumber."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.13"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
end
