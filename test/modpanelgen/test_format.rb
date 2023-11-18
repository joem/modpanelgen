# frozen_string_literal: true

require 'test_helper'

describe Modpanelgen::Format do
  before do
    @the_module = ::Modpanelgen::Format
  end

  it 'has a #plugins method' do
    value(@the_module).must_respond_to :plugins
  end

  describe '#plugins' do
    it 'returns an array' do
      value(@the_module.plugins).must_be_instance_of Array
    end
  end

  it 'has a #loaded_plugins method' do
    value(@the_module).must_respond_to :loaded_plugins
  end

  describe '#loaded_plugins' do
    it 'returns an array' do
      value(@the_module.loaded_plugins).must_be_instance_of Array
    end
  end

  it 'has a #installed_plugins method' do
    value(@the_module).must_respond_to :installed_plugins
  end

  describe '#installed_plugins' do
    it 'returns an array' do
      value(@the_module.installed_plugins).must_be_instance_of Array
    end
  end

  it 'has a #search_plugins method' do
    value(@the_module).must_respond_to :search_plugins
  end

  it 'has a #search_local_plugins method' do
    value(@the_module).must_respond_to :search_local_plugins
  end

  it 'has a #search_installed_plugins method' do
    value(@the_module).must_respond_to :search_installed_plugins
  end

  it 'has a #search_loaded_plugins method' do
    value(@the_module).must_respond_to :search_loaded_plugins
  end

  describe '#search_loaded_plugins' do
    it 'returns a Modpanelgen::Format::FormatPlugin' do
      value(@the_module.search_loaded_plugins('Eurorack')).must_be_kind_of ::Modpanelgen::FormatPlugin
    end
  end

end
