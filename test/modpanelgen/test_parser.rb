# frozen_string_literal: true

require 'test_helper'

describe Modpanelgen::Parser do
  it 'has a plugins method' do
    value(::Modpanelgen::Parser).must_respond_to :plugins
  end

  describe '#plugins' do
    it 'returns an array' do
      value(::Modpanelgen::Parser.plugins).must_be_instance_of Array
    end
  end

  it 'has a loaded_plugins method' do
    value(::Modpanelgen::Parser).must_respond_to :loaded_plugins
  end

  describe '#loaded_plugins' do
    it 'returns an array' do
      value(::Modpanelgen::Parser.loaded_plugins).must_be_instance_of Array
    end
  end

  it 'has a installed_plugins method' do
    value(::Modpanelgen::Parser).must_respond_to :installed_plugins
  end

  describe '#installed_plugins' do
    it 'returns an array' do
      value(::Modpanelgen::Parser.installed_plugins).must_be_instance_of Array
    end
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
