# frozen_string_literal: true

module ModularPanelGen
  module Plugin
    module Format
      # What this does
      class Eurorack < FormatPlugin
        def run
          puts 'Eurorack format plugin has been run!'
        end
      end
    end
  end
end
