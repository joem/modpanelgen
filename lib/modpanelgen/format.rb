# frozen_string_literal: true

module Modpanelgen
  module Format
    module_function

    def plugins
      all_plugins = loaded_plugins + installed_plugins
      # Format them nicely for the list and only show the last class name
      all_plugins.map { |plug| "  #{plug.to_s.split('::').last}" }
      all_plugins #DEBUG
    end

    def loaded_plugins
      Modpanelgen::FormatPlugin.descendants
    end

    def installed_plugins
      # TODO: Make this actually check and find relevant installed plugins!
      ["Modpanelgen::Format::InjectedFormatExample"] #DEBUG
    end
  end
end
