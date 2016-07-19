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
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara", "~> 2.1"
  s.add_development_dependency "pry"
  s.add_development_dependency "jquery-rails"
  s.add_development_dependency "test-unit"
  s.add_development_dependency "sass-rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "poltergeist"
  s.add_development_dependency "rake"
  s.add_development_dependency "turbolinks"
  s.add_development_dependency "rails-assets-sweetalert2"
  s.files         = `git ls-files`.split("\n")
  s.require_paths = ['lib']
end
