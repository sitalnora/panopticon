$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "panopticon/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "panopticon"
  spec.version     = Panopticon::VERSION
  spec.authors     = ["sitalnora"]
  spec.email       = ["aron.latis@golfgenius.com"]
  spec.homepage    = "https://www.google.com"
  spec.summary     = "Watcher of memory."
  spec.description = "Watcher of memory."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", ">= 5.1.7"
  spec.add_dependency "get_process_mem"
  spec.add_dependency "pry"

  spec.add_development_dependency "pry"
end
