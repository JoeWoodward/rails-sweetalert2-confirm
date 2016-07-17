$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "sweetalert2-rails-confirm/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "sweetalert2-rails-confirm"
  s.version     = SweetAlert2RailsConfirm::VERSION
  s.authors     = ["Joe Woodward"]
  s.email       = ["j@joewoodward.me"]
  s.homepage    = "https://github.com/JoeWoodward/sweetalert2-rails-confirm"
  s.summary     = "A Rails confirm replacement with SweetAlert2"
  s.description = ""
  s.license     = "MIT"

  s.add_development_dependency "rails", ">=3.1"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara", "~> 2.1"
  s.add_development_dependency "pry"
  s.files         = `git ls-files`.split("\n")
  s.require_paths = ['lib']
end
