# frozen_string_literal: true

require_relative 'modular_panel_gen/version'
require_relative 'modular_panel_gen/cli'
require_relative 'modular_panel_gen/base_plugin'
require_relative 'modular_panel_gen/format'
require_relative 'modular_panel_gen/format_plugin'
require_relative 'modular_panel_gen/parser'
require_relative 'modular_panel_gen/parser_plugin'
require_relative 'modular_panel_gen/renderer'
require_relative 'modular_panel_gen/renderer_plugin'

# Built-in format plugins:
require_relative 'modular_panel_gen/plugin/format/eurorack'

# Built-in parser plugins:
require_relative 'modular_panel_gen/plugin/parser/kicad_pcb'

# Built-in renderer plugins:
require_relative 'modular_panel_gen/plugin/renderer/kicad_pcb'

module ModularPanelGen
  class Error < StandardError; end
  # Your code goes here...
end
