# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "impermium/version"

Gem::Specification.new do |s|
  s.name        = "impermium"
  s.version     = Impermium::VERSION
  s.platform    = Gem::Platform::RUBY
  s.date = Time.now.strftime('%Y-%m-%d')

  s.authors     = ["Tejaswi Nadahalli"]
  s.email       = ["tejaswi@impermium.com"]
  s.homepage    = "https://github.com/impermium/impermium-ruby-client"
  s.summary     = "Impermium API wrapper"
  s.description = "Ruby wrapper for the Impermium API"

  s.add_dependency "faraday_middleware", ">= 0.8.8"
  s.add_dependency "hashie", "~> 1.2.0"
  s.add_dependency "multi_json"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
