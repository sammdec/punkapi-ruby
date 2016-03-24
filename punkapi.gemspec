require File.expand_path('../lib/punkapi/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = 'punkapi'
  spec.version       = PunkAPI::VERSION.dup
  spec.authors       = ['Sam Mason']
  spec.email         = ['sam.jbmason@gmail.com']

  spec.summary       = %q{Ruby wrapper for the PunkAPI API}
  spec.description   = %q{Ruby wrapper for the PunkAPI API}
  spec.homepage      = 'https://github.com/samjbmason/punkapi-ruby'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'faraday', '~> 0.9.2'

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
