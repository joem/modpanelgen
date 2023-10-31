# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'modpanelgen'

require 'minitest/autorun'
require 'minitest/reporters'
reporter_options = {
  # detailed_skip: false,
  color: true
}
Minitest::Reporters.use! Minitest::Reporters::DefaultReporter.new(reporter_options)
