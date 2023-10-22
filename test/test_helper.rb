# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'panel_generator'

require 'minitest/autorun'
require 'minitest/autorun'
# Use minitest-reporters only if installed.
# https://github.com/minitest-reporters/minitest-reporters
begin
  require 'minitest/reporters'
  # Redgreen-capable version of standard Minitest reporter:
  reporter_options = {
    # detailed_skip: false,
    color: true
  }
  Minitest::Reporters.use! Minitest::Reporters::DefaultReporter.new(reporter_options)
rescue LoadError
end


