# frozen_string_literal: true

module Modpanelgen
  # The class that all renderer plugins inherit from.
  #
  # Renderer plugins must inherit from this class in order for
  # Modpanelgen::Renderer to be able to find them.
  #
  class RendererPlugin < BasePlugin
    # `self.inherited(klass)` and `self.descendants` come from BasePlugin

    # Renderer plugins must define ???????? in their own class in order to be
    # compatible with modpanelgen.
    # FIXME: Fill in this documention.
    # FIXME: Make sure the documentation here shows up in rdoc documents.
    # (Probably need to move it to the top level class documentation?
  end
end
