# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rails_admin-treeview/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Nick Recobra"]
  gem.email         = ["oruenu@gmail.com"]
  gem.description   = %q{Tree-style sidebar navigation}
  gem.summary       = %q{Implements treeview via jquery.treeview for models}
  gem.homepage      = "http://github.com/oruen/rails_admin-treeview"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "rails_admin-treeview"
  gem.require_paths = ["lib"]
  gem.add_dependency "jquery-rails", ">= 1.0"
  gem.version       = RailsAdmin::Treeview::VERSION
end
