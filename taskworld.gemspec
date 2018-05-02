
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "taskworld/version"

Gem::Specification.new do |spec|
  spec.name          = "taskworld"
  spec.version       = Taskworld::VERSION
  spec.authors       = ["shimada"]
  spec.email         = ["yoshihiro.shimada@studyplus.jp"]

  spec.summary       = %q{Taskworld Web API client.}
  spec.description   = %q{Taskworld Web API client.}
  spec.homepage      = "https://github.com/yshimada0330/taskworld"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
