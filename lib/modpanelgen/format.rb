# frozen_string_literal: true

module Modpanelgen
  # Namespace for format methods for dealing with format plugins.
  #
  module Format
    PLUGIN_PREFIX = 'modpanelgen-format-'

    module_function

    # Lists all format plugins.
    #
    def plugins
      all_plugins = loaded_plugins + installed_plugins
      # Format them nicely for the list and only show the last class name
      all_plugins.map { |plug| "  #{snake_case(plug.to_s)}" }
      # all_plugins #DEBUG
    end

    # Lists all loaded ('require'd) format plugins.
    #
    def loaded_plugins
      Modpanelgen::FormatPlugin.descendants
    end

    # Lists all installed gems that are format plugins.
    #
    def installed_plugins
      # This returns an array of names like `modpanelgen-format-your_format`
      specs = Gem::Specification.find_all do |spec|
        spec.name =~ /^#{PLUGIN_PREFIX}/
      end
      specs.map!(&:name)
    end

    # Searches for a format plugin based on provided +name+ and returns a new
    # instance of it if found, or nil if none found.
    #
    # Searches in this order:
    # 1. local files
    # 2. installed gems
    # 3. default/loaded plugins
    # TODO: Figure out what it returns. The name of the plugin? An new instance of the class?
    #
    # The +name+ should be the end of the plugin's name,
    # without 'modpanelgen/format/' or 'modpanelgen-format-'.
    #
    # So for example, if the full name of the plugin is
    # 'modpanelgen-format-your_format' then +name+ should be
    # 'your_format'.
    #
    def search_plugins(name)
      result = search_local_plugins(name)
      return result if result

      result = search_installed_plugins(name)
      return result if result

      # If neither of those returned anything, then return this
      search_loaded_plugins(name)
    end

    # Searches local files in the cwd for a format plugin based on provided
    # +name+ and returns a new instance of it if found, or nil if not found.
    #
    # The +name+ should be the end of the plugin's name,
    # without 'modpanelgen/format/' or 'modpanelgen-format-'.
    #
    # So for example, if the full name of the plugin is
    # 'modpanelgen-format-your_format' then +name+ should be
    # 'your_format'.
    #
    def search_local_plugins(name)
      # FIXME: Make this work!
    end

    # Searches installed gems for a format plugin based on provided +name+ and
    # returns a new instance of it if found, or nil if not found.
    #
    # The +name+ should be the end of the plugin's name,
    # without 'modpanelgen/format/' or 'modpanelgen-format-'.
    #
    # So for example, if the full name of the plugin is
    # 'modpanelgen-format-your_format' then +name+ should be
    # 'your_format'.
    #
    def search_installed_plugins(name)
      specs = Gem::Specification.find_all_by_name("#{PLUGIN_PREFIX}#{name.downcase}")
      # In case there are multiple versions, sort the returned array & take last item
      specs.max_by(&:version)
    end

    # Searches loaded ('require'd) gems for a format plugin based on provided
    # +name+ and returns a new instance of it if found.
    #
    # The +name+ should be the end of the plugin's name,
    # without 'modpanelgen/format/' or 'modpanelgen-format-'.
    #
    # So for example, if the full name of the plugin is
    # 'modpanelgen-format-your_format' then +name+ should be
    # 'your_format'.
    #
    def search_loaded_plugins(name)
      specs = loaded_plugins.find_all do |spec|
        spec.to_s == "#{camelcase(PLUGIN_PREFIX.gsub('-', '/'))}#{camelcase(name)}"
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
      string = string.sub(/^[a-z\d]*/, &:capitalize)
      string.gsub!(%r{(?:_|(/))([a-z\d]*)}i) { "#{::Regexp.last_match(1)}#{::Regexp.last_match(2).capitalize}" }
      string.gsub!('/', '::')
      string
    end
  end
end
