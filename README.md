# ModularPanelGen

**NOTE: This is currently a work in progress. Not finished yet. Sorry.**

This library lets you generate panels for synthesizer modules.

It can be used either via the command line or via the library for integration into something else. You can generate blank panels by specifying a size, but the more interesting use is automatically generating panels (with holes) based on input KiCad PCB files.

This library was primarily designed to automatically generate KiCad PCB eurorack-format panels based a KiCad PCB input file, since I didn't want to risk getting my measurements wrong when making my front panel.But I'm going to add as many built-in panel formats as possible (such as the 1U formats, the 4U formats, etc) and it can take arbitrary sizes too. Currently it's only able to output KiCad PCB files, but I'd like to add other useful outputs too, like PDF drill guides and lasercutter outputs.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add modular_panel_gen

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install modular_panel_gen

## Command Line Usage

TODO: Write usage instructions here

## Library Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/joem/modular_panel_gen

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
