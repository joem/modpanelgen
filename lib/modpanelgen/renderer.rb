# frozen_string_literal: true

module Modpanelgen
  # Namespace for renderer methods for dealing with renderer plugins.
  #
  module Renderer
    PLUGIN_PREFIX = 'modpanelgen-renderer-'

    module_function

    def plugins
      all_plugins = loaded_plugins + installed_plugins
      # Format them nicely for the list and only show the last class name
      all_plugins.map { |plug| "  #{snake_case(plug.to_s)}" }
      # all_plugins #DEBUG
    end

    def loaded_plugins
      Modpanelgen::RendererPlugin.descendants
    end

    def installed_plugins
      # This returns an array of names like `modpanelgen-renderer-your_renderer`
      specs = Gem::Specification.find_all do |spec|
        spec.name =~ /^#{PLUGIN_PREFIX}/
      end
      specs.map!(&:name)
    end

    # Makes an underscored, lowercase form from the expression in the string.
    #
    # Changes '::' to '/' to convert namespaces to paths.
    #
    #   underscorecase('ActiveModel')         # => "active_model"
    #   underscorecase('ActiveModel::Errors') # => "active_model/errors"
    #
    # (This method is adapted from rails/activesupport.)
    def snake_case(camel_cased_word)
      return camel_cased_word unless /[A-Z-]|::/.match?(camel_cased_word)

      word = camel_cased_word.to_s.gsub('::', '/')
      word.gsub!(/([A-Z\d]+)([A-Z][a-z])/, '\1_\2')
      word.gsub!(/([a-z\d])([A-Z])/, '\1_\2')
      word.tr!('-', '_')
      word.downcase!
      word
    end
  end
end
