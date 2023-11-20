# frozen_string_literal: true

module Modpanelgen
  # Namespace for methods for dealing with format plugins.
  #
  # Format mixes in the PluginHandler module, whose methods rely on the prefix
  # constants defined here. Although the methods of Format are defined by the
  # PluginHandler module, we have chosen to document them here for clarity.
  #
  # == What's Here
  #
  # First, what's elsewhere. \Class \Format:
  #
  # - Extends {module PluginHandler}[rdoc-ref:PluginHandler], gaining the following methods:
  #   - {#plugins}[rdoc-ref:PluginHandler#plugins]: Returns an array of all
  #     format plugins, loaded or installed.
  #   - {#loaded_plugins}[rdoc-ref:PluginHandler#loaded_plugins]: Returns an
  #     array of all loaded ('require'd) format plugins.
  #   - {#installed_plugins}[rdoc-ref:PluginHandler#installed_plugins]: Returns
  #     an array of all installed gems that are format plugins.
  #   - {#search_plugins}[rdoc-ref:PluginHandler#search_plugins]: Returns a
  #     format plugin based on provided +name+ if found (searching local,
  #     installed, and loaded plugins); otherwise returns +nil+.
  #   - {#search_local_plugins}[rdoc-ref:PluginHandler#search_local_plugins]:
  #     Returns a format plugin in the cwd based on provided +name+ if found;
  #     otherwise returns +nil+.
  #   - {#search_installed_plugins}[rdoc-ref:PluginHandler#search_installed_plugins]:
  #     Returns a format plugin from the installed gems based on provided
  #     +name+ if found; otherwise returns +nil+.
  #   - {#search_loaded_plugins}[rdoc-ref:PluginHandler#search_loaded_plugins]:
  #     Returns a loaded ('require'd) format plugin based on provided +name+ if
  #     found; otherwise returns +nil+.
  #   - {#snake_case}[rdoc-ref:PluginHandler#snake_case]: Returns an
  #     underscored, lowercase form from the expression in the string, and
  #     changes '::' to '/' to convert namespaces to paths.
  #   - {#camelcase}[rdoc-ref:PluginHandler#camelcase]: Returns an
  #     UpperCamelCase form of the expression in the string, and converts '/'
  #     to '::' to convert paths to namespaces.
  #
  # Here, class \Format provides the following constants (which are used by the
  # methods from \PluginHandler):
  #
  # - PLUGIN_PREFIX: Used for methods that need 'modpanelgen-format-'
  # - PLUGIN_PREFIX_COLONS: Used for methods that need 'Modpanelgen::FormatPlugin'
  #
  module Format
    extend ::Modpanelgen::PluginHandler

    PLUGIN_PREFIX = 'modpanelgen-format-'
    PLUGIN_PREFIX_COLONS = 'Modpanelgen::FormatPlugin'
  end
end
