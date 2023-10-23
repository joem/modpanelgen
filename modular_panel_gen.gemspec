# frozen_string_literal: true

require_relative 'lib/modular_panel_gen/version'

Gem::Specification.new do |spec|
  spec.name = 'modular_panel_gen'
  spec.version = ModularPanelGen::VERSION
  spec.authors = ['Joe Miragliuolo']
  spec.email = ['sod@llawn.com']

  spec.summary = 'Generate panels for synthesizer modules'
  spec.description = <<~DESCRIPTION
    Generate panels for synthesizer modules, via library or command line,
    with optional automatic generation based on a KiCad PCB file.
  DESCRIPTION
  spec.homepage = 'https://github.com/joem/modular_panel_gen'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.6.0'

  # spec.metadata['allowed_push_host'] = 'TODO: Set to your gem server https://example.com'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  # spec.metadata['changelog_uri'] = 'TODO: Put your gem\'s CHANGELOG.md URL here.'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split('\x0').reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency 'example-gem', '~> 1.0'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'minitest-reporters'
  spec.add_development_dependency 'rake'

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
