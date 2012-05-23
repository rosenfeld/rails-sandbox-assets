# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rails-sandbox-assets/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Rodrigo Rosenfeld Rosas"]
  gem.email         = ["rr.rosas@gmail.com"]
  gem.description   = %q{Allows assets to be served in a sandboxed application in a Rails project}
  gem.homepage      = "http://github.com/rosenfeld/rails-sandbox-assets"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rails-sandbox-assets"
  gem.require_paths = ["lib"]
  gem.version       = Rails::Sandbox::Assets::VERSION
end
