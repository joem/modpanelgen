# frozen_string_literal: true

module Modpanelgen
  # This is the class that all plugins types must inherit
  class BasePlugin
    def self.inherited(klass)
      super # Not sure I know why this needs a `super` call but Rubocop says so
      @descendants ||= []
      @descendants << klass
    end

    def self.descendants
      @descendants || []
    end
  end
end
