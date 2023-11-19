# frozen_string_literal: true

module Modpanelgen
  # The class that all parser plugins inherit from.
  #
  # Parser plugins must inherit from this class in order for
  # Modpanelgen::Parser to be able to find them.
  #
  class ParserPlugin < BasePlugin
    # `self.inherited(klass)` and `self.descendants` come from BasePlugin

    # Parser plugins must define ???????? in their own class in order to be
    # compatible with modpanelgen.
    # FIXME: Fill in this documention.
    # FIXME: Make sure the documentation here shows up in rdoc documents.
    # (Probably need to move it to the top level class documentation?
  end
end
