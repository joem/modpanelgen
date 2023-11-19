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

  describe '#search_local_plugins' do
    it "returns nil when it can't find the plugin" do
      value(@the_module.search_local_plugins('cantfindthisfakefake')).must_be_nil
    end

    it 'returns a Modpanelgen::Format::FormatPlugin when it finds the plugin' do
      # value(@the_module.search_local_plugins('testtest2')).must_be_kind_of ::Modpanelgen::FormatPlugin
      skip 'How to make it work right and testable?' # FIXME
    end
  end

  it 'has a #search_installed_plugins method' do
    value(@the_module).must_respond_to :search_installed_plugins
  end

  describe '#search_installed_plugins' do
    it "returns nil when it can't find the plugin" do
      value(@the_module.search_installed_plugins('cantfindthisfakefake')).must_be_nil
    end

    it 'returns a Modpanelgen::Format::FormatPlugin when it finds the plugin' do
      # spec = Gem::Specification.new do |s|
      #   s.name          = 'modpanelgen-format-testtest2'
      #   s.version       = '1.2.3'
      #   s.summary       = "Fake modpanelgen-format-testtest2 gem"
      #   s.author        = "Nobody"
      #   s.email         = "nobody@localhost"
      #   s.files         = []
      #   s.executables   = []
      #   s.require_paths = ["lib"]
      # end
      # Gem::Specification.add_spec(spec)
      # value(@the_module.search_installed_plugins('testtest2')).must_be_kind_of ::Modpanelgen::FormatPlugin
      skip 'What else do I need to do to be able to instantiate it??' # FIXME
    end
  end

  it 'has a #search_loaded_plugins method' do
    value(@the_module).must_respond_to :search_loaded_plugins
  end

  describe '#search_loaded_plugins' do
    it "returns nil when it can't find the plugin" do
      value(@the_module.search_loaded_plugins('cantfindthisfakefake')).must_be_nil
    end

    it 'returns a Modpanelgen::Format::FormatPlugin when it finds the plugin' do
      value(@the_module.search_loaded_plugins('Eurorack')).must_be_kind_of ::Modpanelgen::FormatPlugin
    end
  end

end
