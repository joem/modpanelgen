# frozen_string_literal: true

require_relative 'modpanelgen/version'
require_relative 'modpanelgen/cli'
require_relative 'modpanelgen/base_plugin'
require_relative 'modpanelgen/format'
require_relative 'modpanelgen/format_plugin'
require_relative 'modpanelgen/parser'
require_relative 'modpanelgen/parser_plugin'
require_relative 'modpanelgen/renderer'
require_relative 'modpanelgen/renderer_plugin'

# Built-in format plugins:
require_relative 'modpanelgen/plugin/format/eurorack'

# Built-in parser plugins:
require_relative 'modpanelgen/plugin/parser/kicad_pcb'

# Built-in renderer plugins:
require_relative 'modpanelgen/plugin/renderer/kicad_pcb'

module Modpanelgen
  class Error < StandardError; end
  # Your code goes here...
end
