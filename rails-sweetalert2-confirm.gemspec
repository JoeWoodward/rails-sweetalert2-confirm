$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_sweetalert2_confirm/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails-sweetalert2-confirm"
  s.version     = RailsSweetAlert2Confirm::VERSION
  s.authors     = ["Joe Woodward"]
  s.email       = ["j@joewoodward.me"]
  s.homepage    = "https://github.com/JoeWoodward/rails-sweetalert2-confirm"
  s.summary     = "A Rails Confirm Replacement Using SweetAlert2"
  s.description = "Replace rail's built in link_to/submit/button with confirmations with SweetAlert2 confirmations"
  s.license     = "MIT"

  s.add_development_dependency "rails", ">=4"
  s.add_development_dependency "rspec-rails", '~> 3.5'
  s.add_development_dependency "capybara", "~> 2.1"
  s.add_development_dependency "pry", '~> 0.10'
  s.add_development_dependency "jquery-rails", '~> 4.1'
  s.add_development_dependency "test-unit", '~> 3.2'
  s.add_development_dependency "sass-rails", '~> 5.0'
  s.add_development_dependency "poltergeist", '~> 1.10'
  s.add_development_dependency "rake", '~> 11.2'
  s.add_development_dependency "turbolinks", '~> 5.0'
  s.files         = `git ls-files`.split("\n")
  s.require_paths = ['lib']
end
