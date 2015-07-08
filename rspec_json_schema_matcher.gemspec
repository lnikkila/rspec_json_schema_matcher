$LOAD_PATH << File.expand_path('../lib', __FILE__)

require 'rspec_json_schema_matcher/version'

Gem::Specification.new do |spec|
  spec.name          = "rspec_json_schema_matcher"
  spec.version       = RSpecJSONSchemaMatcher::VERSION
  spec.authors       = ["Leo Nikkilä"]
  spec.email         = ["hello@lnikki.la"]

  spec.summary       = "Validate JSON in your specs using JSON schema."
  spec.homepage      = "https://github.com/lnikkila/rspec_json_schema_matcher"
  spec.license       = "ISC"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "rspec",       "~> 3.0.0"
  spec.add_runtime_dependency "json-schema", "~> 2.5.0"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake",    "~> 10.0"
  spec.add_development_dependency "pry"
end
