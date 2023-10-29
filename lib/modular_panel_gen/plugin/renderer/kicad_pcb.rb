# frozen_string_literal: true

module ModularPanelGen
  module Plugin
    module Renderer
      # What this does
      class KicadPCB < RendererPlugin
        def run
          puts 'KicadPCB renderer plugin has been run!'
        end
      end
    end
  end
end
