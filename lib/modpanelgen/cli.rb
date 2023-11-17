# frozen_string_literal: true

require 'optparse'

module Modpanelgen
  # This class is called by the executable. It handles all command line
  # processing and sets the app in motion.
  class CLI
    def initialize
      @options = {
        format: 'default'
      }
    end

    def run(argv)
      if argv.empty? # rubocop:disable Style/IfUnlessModifier
        argv << '--help'
      end
      parse_args(argv)
      puts "DEBUG: Options right after parsing:" #DEBUG #FIXME
      p @options #DEBUG #FIXME
      @options[:format] = Modpanelgen::Format.search(@options[:format])
      # TODO: check for and set input file, if one was given. I think it should be in argv?
      panel = Modpanelgen::Panel.new(**@options)
    end

    def parse_args(argv)
      @options_parser = OptionParser.new do |opts|
        opts.banner = 'Usage: modpanelgen [options] [input_file]'

        # opts.on('-v', '--[no-]verbose', 'Run verbosely') do |v|
        #   options[:verbose] = v
        # end

        # The only reason why the adding of the options is broken out into
        # separate methods is to keep the abc count within acceptable limits
        # for rubocop.
        add_main_options(opts)
        add_info_options(opts)
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

    def add_main_options(options)
      options.on('-f', '--format FORMAT', 'Format') { |f| @options[:format] = f }
      options.on('-x', '--size-x SIZE_X', 'Size X') { |s| @options[:size_x] = s }
      options.on('-y', '--size-y SIZE_Y', 'Size Y') { |s| @options[:size_y] = s }
      options.on('-i', '--input INPUT', 'Input') { |i| @options[:input] = i }
      options.on('-i', '--output OUTPUT', 'Output') { |i| @options[:output] = i }
      options.on('-a', '--align ALIGN', 'Align') { |a| @options[:align] = a }
    end

    def add_info_options(options)
      options.on('--list-formats', 'List available formats') { list_formats }
      options.on('--list-parsers', 'List available parsers') { list_parsers }
      options.on('--list-renderers', 'List available renderers') { list_renderers }
      options.on('--check-format FILE', 'Check a format file') { |f| check_format(f) }
      options.on('--check-parser FILE', 'Check a parser file') { |f| check_parser(f) }
      options.on('--check-renderer FILE', 'Check a renderer file') { |f| check_renderer(f) }
      options.on_tail('-h', '--help', 'Show this message') { show_help }
      options.on_tail('-v', '--version', 'Show the version number') { show_version }
    end

    def check_format(file)
      puts 'Not implemented yet!' # FIXME
      # TODO: Check file somehow
      exit
    end

    def check_parser(file)
      puts 'Not implemented yet!' # FIXME
      # TODO: Check file somehow
      exit
    end

    def check_renderer(file)
      puts 'Not implemented yet!' # FIXME
      # TODO: Check file somehow
      exit
    end

    def list_formats
      puts 'Available formats:'
      puts Modpanelgen::Format.plugins
      exit
    end

    def list_parsers
      puts 'Available parsers:'
      puts Modpanelgen::Parser.plugins
      exit
    end

    def list_renderers
      puts 'Available renderers:'
      puts Modpanelgen::Renderer.plugins
      exit
    end

    def show_help
      puts @options_parser
      exit
    end

    def show_version
      puts "modpanelgen #{Modpanelgen::VERSION}"
      exit
    end
  end
end
