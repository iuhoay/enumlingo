require_relative "lib/enumlingo/version"

Gem::Specification.new do |spec|
  spec.name        = "enumlingo"
  spec.version     = Enumlingo::VERSION
  spec.authors     = ["iuhoay"]
  spec.email       = ["iuhoay@gmail.com"]
  spec.homepage    = "https://github.com/iuhoay/enumlingo"
  spec.summary     = "Enumlingo is a lightweight Ruby gem designed to enhance Rails applications by offering straightforward internationalization for enum fields. It simplifies the process of translating enum values across different locales, ensuring a user-friendly, multilingual experience in Rails applications."
  spec.description = spec.summary
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/iuhoay/enumlingo"
  spec.metadata["changelog_uri"] = "https://github.com/iuhoay/enumlingo/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", "~> 7.1"
end
