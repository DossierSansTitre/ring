lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ring/version'

Gem::Specification.new do |spec|
  spec.name         = "ring"
  spec.version      = Ring::VERSION
  spec.authors      = ["Nax"]
  spec.email        = ["max@bacoux.com"]

  spec.summary      = 'A web framework with some design.'
  spec.homepage     = 'https://github.com/DossierSansTitre/ring'
  spec.license      = 'MIT'

  spec.files         = Dir["lib/**/*", "exe/*"]
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
