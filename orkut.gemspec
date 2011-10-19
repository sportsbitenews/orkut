# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "orkut/version"

Gem::Specification.new do |s|
  s.name        = 'orkut'
  s.version     = Orkut::Version.to_s
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Umanni']
  s.email       = ['contato@umanni.com']
  s.homepage    = 'https://github.com/umanni/orkut'
  s.summary     = %q{Orkut API wrapper}
  s.description = %q{A Ruby wrapper for the Orkut REST/RPC API.}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'omniauth', [">= 0.3.0"]
end
