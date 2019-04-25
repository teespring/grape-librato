# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'grape-librato/version'

Gem::Specification.new do |gem|
  gem.name          = "grape-librato"
  gem.version       = Librato::Grape::VERSION
  gem.authors       = ["Sean Moon"]
  gem.email         = ["ssamoon@ucla.edu"]
  gem.description   = %q{librato metrics for grape}
  gem.summary       = %q{librato metrics for grape}
  gem.homepage      = "https://github.com/seanmoon/grape-librato"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(spec)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency(%q<grape>)
  gem.add_runtime_dependency %q<librato-rack>, "1.1.0"
end
