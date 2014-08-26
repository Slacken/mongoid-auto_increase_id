# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mongoid/auto_increase_id/version'

Gem::Specification.new do |spec|
  spec.name          = "mongoid-auto_increase_id"
  spec.version       = Mongoid::AutoIncreaseId::VERSION
  spec.authors       = ["Binz"]
  spec.email         = ["xinkiang@gmail.com"]
  spec.summary       = %q{Override id field to MySQL like auto increment for Mongoid in a way different from github.com:@huacnlee}
  spec.description   = %q{Mongoid auto increase id}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"

  spec.add_runtime_dependency "mongoid"
end
