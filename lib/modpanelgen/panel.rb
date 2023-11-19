# frozen_string_literal: true

module Modpanelgen
  # A Modpanelgen::Panel instance represents a modular synth panel.
  #
  class Panel
    # def initialize(size_x:, size_y:, align:, **_other_kw_options)
    def initialize(**all_kw_options) # DEBUG # rubocop:disable
      puts 'DEBUG: Options that Panel.new received:' # DEBUG
      p all_kw_options # DEBUG
    end
  end
end
