
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'method_fallback/version'

Gem::Specification.new do |spec|
  spec.name          = 'method_fallback'
  spec.version       = MethodFallback::VERSION
  spec.authors       = ['Fabian Mersch']
  spec.email         = ['fabianmersch@gmail.com']

  spec.summary       = %q{Fallback to other method in case the original method returned nil.}
  spec.description   = %q{Fallback to other method in case the original method returned nil.}
  spec.homepage      = 'https://github.com/f-mer/method_fallback'
  spec.license       = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.3'

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'simplecov', '~> 0.16'
end
