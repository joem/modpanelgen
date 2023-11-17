# frozen_string_literal: true

require_relative 'modpanelgen/base_plugin'
require_relative 'modpanelgen/cli'
require_relative 'modpanelgen/format'
require_relative 'modpanelgen/format_plugin'
require_relative 'modpanelgen/panel'
require_relative 'modpanelgen/parser'
require_relative 'modpanelgen/parser_plugin'
require_relative 'modpanelgen/renderer'
require_relative 'modpanelgen/renderer_plugin'
require_relative 'modpanelgen/version'

# Built-in format plugins:
require_relative 'modpanelgen/format/eurorack'

# Built-in parser plugins:
require_relative 'modpanelgen/parser/kicad_pcb'

# Built-in renderer plugins:
require_relative 'modpanelgen/renderer/kicad_pcb'

module Modpanelgen
  class Error < StandardError; end
  # Your code goes here...
end
