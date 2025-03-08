require_relative "lib/abizvn/clients/version"

Gem::Specification.new do |spec|
  spec.name        = "abizvn-clients"
  spec.version     = Abizvn::Clients::VERSION
  spec.authors     = [ "Juan" ]
  spec.email       = [ "juanonsoftware@gmail.com" ]
  spec.homepage    = "http://dev.abizvn.com"
  spec.summary     = "Management of clients"
  spec.description = "Management of clients entity and its domains"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/abizvncom/abizvn-clients"
  spec.metadata["changelog_uri"] = "https://github.com/abizvncom/abizvn-clients"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", "~> 7.2"
  spec.add_dependency "valid_email2", "~> 7.0"
  spec.add_dependency "phonelib", "~> 0.10"
  spec.add_development_dependency "rspec-rails", "~> 7.0"
end
