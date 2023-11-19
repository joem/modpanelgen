# frozen_string_literal: true

module Modpanelgen
  # The class that all format plugins inherit from.
  #
  # Format plugins must inherit from this class in order for
  # Modpanelgen::Format to be able to find them.
  #
  class FormatPlugin < BasePlugin
    # `self.inherited(klass)` and `self.descendants` come from BasePlugin

    # Format plugins must define ???????? in their own class in order to be
    # compatible with modpanelgen.
    # FIXME: Fill in this documention.
    # FIXME: Make sure the documentation here shows up in rdoc documents.
    # (Probably need to move it to the top level class documentation?
  end
end
