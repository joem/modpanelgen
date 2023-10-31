# frozen_string_literal: true

require 'test_helper'

describe Modpanelgen::CLI do
  it 'must respond to run' do
    value(::Modpanelgen::CLI.new).must_respond_to 'run'
  end

  # it 'shows help with no args' do
  #   _ { ::Modpanelgen::CLI.new([]).run }.must_output /Usage: modpanelgen\.rb \[options\]/, ''
  # end

  # it 'shows usage given --help' do
  #   _{ ::Modpanelgen::CLI.new.run(['--help']) }.must_output (/Usage: modpanelgen\.rb \[options\]/), ''
  # end

  # it 'shows help given --help' do
  #   _{ ::Modpanelgen::CLI.new.run(['--help']) }.must_output (/Prints this help/), ''
  # end

  # it 'exits after showing help' do
  #   _{ ::Modpanelgen::CLI.new.run(['--help']) }.must_raise SystemExit
  #   # err.status.must_equal 42
  # end
end
