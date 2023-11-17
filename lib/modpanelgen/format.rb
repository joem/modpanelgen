# frozen_string_literal: true

module Modpanelgen
  module Format
    PLUGIN_PREFIX = 'modpanelgen-format-'

    module_function

    def plugins
      all_plugins = loaded_plugins + installed_plugins
      # Format them nicely for the list and only show the last class name
      all_plugins.map { |plug| "  #{snake_case(plug.to_s)}" }
      # all_plugins #DEBUG
    end

    def loaded_plugins
      Modpanelgen::FormatPlugin.descendants
    end

    def installed_plugins
      # This returns an array of names like `modpanelgen-format-your_format`
      specs = Gem::Specification.find_all do |spec|
        spec.name =~ /^#{PLUGIN_PREFIX}/
      end
      specs.map!(&:name)
    end

    # Search in this order:
    # 1. local files
    # 2. installed gems
    # 3. default/loaded plugins
    # TODO: Figure out what it returns. The name of the plugin? An new instance of the class?
    #
    # The plugin_short_name should be the end of the plugin's name,
    # without 'modpanelgen/format/' or 'modpanelgen-format-'.
    #
    # So for example, if the full name of the plugin is
    # 'modpanelgen-format-your_format' then `plugin_short_name` should be
    # 'your_format'.
    #
    def search_plugins(plugin_short_name)
      result = nil # default return value if nothing returns by the end

      result = search_local_files(plugin_short_name)
      return result if result

      result = search_installed_plugins(plugin_short_name)
      return result if result

      result = search_loaded_plugins(plugin_short_name)
      result
    end

    def search_local_files(plugin_short_name)
      # TODO: Make this work!
    end

    def search_installed_plugins(plugin_short_name)
      specs = Gem::Specification.find_all_by_name("#{PLUGIN_PREFIX}#{plugin_short_name.downcase}")
      # In case there are multiple versions, sort the returned array & take last item
      spec = specs.max_by(&:version)
      spec
    end

    def search_loaded_plugins(plugin_short_name)
      specs = loaded_plugins.find_all do |spec|
        spec.to_s == "#{camelcase(PLUGIN_PREFIX.gsub('-','/'))}#{camelcase(plugin_short_name)}"
      end
      # specs.first if specs.length == 1 #DEBUG
      specs.first.new if specs.length == 1
    end

    # Makes an underscored, lowercase form from the expression in the string.
    # And changes '::' to '/' to convert namespaces to paths.
    #
    #   snake_case('ActiveModel')         # => "active_model"
    #   snake_case('ActiveModel::Errors') # => "active_model/errors"
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

    # Converts strings to UpperCamelCase.
    # Also converts '/' to '::' which is useful for converting
    # paths to namespaces.
    #
    #   camelcase('active_model')                # => "ActiveModel"
    #   camelcase('active_model/errors')         # => "ActiveModel::Errors"
    #
    # (This method is adapted from rails/activesupport.)
    def camelcase(term)
      string = term.to_s
      string = string.sub(/^[a-z\d]*/) { |match| match.capitalize }
      string.gsub!(/(?:_|(\/))([a-z\d]*)/i) { "#{$1}#{$2.capitalize}" }
      string.gsub!("/", "::")
      string
    end
  end
end
