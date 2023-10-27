# frozen_string_literal: true

require 'test_helper'

describe ModularPanelGen::CLI do
  it 'must respond to run' do
    value(::ModularPanelGen::CLI.new).must_respond_to 'run'
  end

  # it 'shows help with no args' do
  #   _ { ::ModularPanelGen::CLI.new([]).run }.must_output /Usage: modular_panel_gen\.rb \[options\]/, ''
  # end

  # it 'shows usage given --help' do
  #   _{ ::ModularPanelGen::CLI.new.run(['--help']) }.must_output (/Usage: modular_panel_gen\.rb \[options\]/), ''
  # end

  # it 'shows help given --help' do
  #   _{ ::ModularPanelGen::CLI.new.run(['--help']) }.must_output (/Prints this help/), ''
  # end

  # it 'exits after showing help' do
  #   _{ ::ModularPanelGen::CLI.new.run(['--help']) }.must_raise SystemExit
  #   # err.status.must_equal 42
  # end
end

