# frozen_string_literal: true
require 'optparse'

module ModularPanelGen
  class CLI
    def initialize
      @options = {}
    end

    def run(argv)
      if argv.empty?
        argv << '--help'
      end
      parse_args(argv)
    end

    def parse_args(argv)
      OptionParser.new do |opts|
        opts.banner = "Usage: modular_panel_gen.rb [options] [input_file]"

        # opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
        #   options[:verbose] = v
        # end

        opts.on_tail("-h", "--help", "show this message") do
          puts opts
          exit
        end

        opts.on_tail('--version', 'print the version number, then exit') do
          puts "modular_panel_gen #{ModularPanelGen::VERSION}"
          exit
        end
      end.parse!(argv)
    end
  end
end

# ::ModularPanelGen::CLI.new.run(ARGV) #DEBUG
