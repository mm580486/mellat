# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mellat/version'

Gem::Specification.new do |spec|
  spec.name          = "mellat"
  spec.version       = Mellat::VERSION
  spec.authors       = ["mohammad mahmoudi"]
  spec.email         = ["mm580486@gmail.com"]

  spec.summary       = %q{A gem to to send and verify payments with mellat bank}
  spec.homepage      = "https://github.com/mm580486/mellat"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.

   spec.add_dependency 'savon', ['~> 2.0']
   spec.add_dependency 'i18n', ['~> 0.8.0']

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
end
