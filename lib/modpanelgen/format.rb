# frozen_string_literal: true

module Modpanelgen
  # Namespace for format methods for dealing with format plugins.
  #
  module Format
    extend ::Modpanelgen::PluginHandler

    PLUGIN_PREFIX = 'modpanelgen-format-'
    PLUGIN_PREFIX_COLONS = 'Modpanelgen::FormatPlugin'

    # TODO: Add all this as documentation? Or does the 'extend' above bring in
    # the documentation from there??

    ## Lists all format plugins.
    ##
    #def plugins

    ## Lists all loaded ('require'd) format plugins.
    ##
    #def loaded_plugins

    ## Lists all installed gems that are format plugins.
    ##
    #def installed_plugins

    ## Searches for a format plugin based on provided +name+ and returns a new
    ## instance of it if found, or nil if none found.
    ##
    ## Searches in this order:
    ## 1. local files
    ## 2. installed gems
    ## 3. default/loaded plugins
    ## TODO: Figure out what it returns. The name of the plugin? An new instance of the class?
    ##
    ## The +name+ should be the end of the plugin's name,
    ## without 'modpanelgen/format/' or 'modpanelgen-format-'.
    ##
    ## So for example, if the full name of the plugin is
    ## 'modpanelgen-format-your_format' then +name+ should be
    ## 'your_format'.
    ##
    #def search_plugins(name)

    ## Searches local files in the cwd for a format plugin based on provided
    ## +name+ and returns a new instance of it if found, or nil if not found.
    ##
    ## The +name+ should be the end of the plugin's name,
    ## without 'modpanelgen/format/' or 'modpanelgen-format-'.
    ##
    ## So for example, if the full name of the plugin is
    ## 'modpanelgen-format-your_format' then +name+ should be
    ## 'your_format'.
    ##
    #def search_local_plugins(name)

    ## Searches installed gems for a format plugin based on provided +name+ and
    ## returns a new instance of it if found, or nil if not found.
    ##
    ## The +name+ should be the end of the plugin's name,
    ## without 'modpanelgen/format/' or 'modpanelgen-format-'.
    ##
    ## So for example, if the full name of the plugin is
    ## 'modpanelgen-format-your_format' then +name+ should be
    ## 'your_format'.
    ##
    #def search_installed_plugins(name)

    ## Searches loaded ('require'd) gems for a format plugin based on provided
    ## +name+ and returns a new instance of it if found.
    ##
    ## The +name+ should be the end of the plugin's name,
    ## without 'modpanelgen/format/' or 'modpanelgen-format-'.
    ##
    ## So for example, if the full name of the plugin is
    ## 'modpanelgen-format-your_format' then +name+ should be
    ## 'your_format'.
    ##
    #def search_loaded_plugins(name)

    ## Makes an underscored, lowercase form from the expression in the string.
    ## And changes '::' to '/' to convert namespaces to paths.
    ##
    ##   snake_case('ActiveModel')         # => "active_model"
    ##   snake_case('ActiveModel::Errors') # => "active_model/errors"
    ##
    ## (This method is adapted from rails/activesupport.)
    #def snake_case(camel_cased_word)

    ## Converts strings to UpperCamelCase.
    ## Also converts '/' to '::' which is useful for converting
    ## paths to namespaces.
    ##
    ##   camelcase('active_model')                # => "ActiveModel"
    ##   camelcase('active_model/errors')         # => "ActiveModel::Errors"
    ##
    ## (This method is adapted from rails/activesupport.)
    #def camelcase(term)
  end
end
