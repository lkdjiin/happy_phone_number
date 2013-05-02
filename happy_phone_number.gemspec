$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "happy_phone_number/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "happy_phone_number"
  s.version     = HappyPhoneNumber::VERSION
  s.authors     = ["Xavier Nayrac"]
  s.email       = ["xavier.nayrac@gmail.com"]
  s.homepage    = "https://github.com/lkdjiin/happy_phone_number"
  s.summary     = "Rails plugin to format phone number."
  s.description = "Rails plugin to format phone number."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.markdown"]

  s.add_dependency "rails", "~> 3.2.13"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
end
