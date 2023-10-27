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
      @options_parser = OptionParser.new do |opts|
        opts.banner = "Usage: modular_panel_gen.rb [options] [input_file]"

        # opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
        #   options[:verbose] = v
        # end

        opts.on_tail("-h", "--help", "show this message") { show_help }
        opts.on_tail('--version', 'print the version number, then exit') { show_version }
      end
      @options_parser.parse!(argv)

      # Catch cases on invalid options and remind the user what's valid
    rescue OptionParser::InvalidOption => e
      puts e
      # Don't replace the following with `show_help` since we want the `exit 1`
      puts @options_parser
      exit 1
    end

    private

    def show_help
      puts @options_parser
      exit
    end

    def show_version
      puts "modular_panel_gen #{ModularPanelGen::VERSION}"
      exit
    end
  end
end
