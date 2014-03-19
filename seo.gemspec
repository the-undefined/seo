$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "seo/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "seo"
  s.version     = Seo::VERSION
  s.authors     = ["Joe James"]
  s.email       = ["joe@joejames.io"]
  s.homepage    = "http://github.com/skisolutions/seo"
  s.summary     = "SEO management tasks as a Rails engine."
  s.description = "Manage tasks like 301 redirects and meta tags"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/**"]

  s.add_dependency "rails", "~> 3.2.13"

  s.add_development_dependency "mysql2"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "pry-nav"
end
