#
# pry
# pry-coolline
# pry-doc
# pry-remote
# pry-theme
#
Pry.config.editor = "gvim --remote-silent"

Pry.hooks.add_hook(:after_session, :say_bye) do
  puts "fuck off Gnida"
end

Pry.prompt = [Proc.new{ |obj, nest_level| "#{RUBY_VERSION}-#{RUBY_PATCHLEVEL} (#{obj}):#{nest_level} > " },
              Proc.new{ |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} * " } ]


cmd_aliases = {
  'continue'  => 'c',
  'step'      => 's',
  'next'      => 'n'
}
cmd_aliases.each do |_cmd, _alias|
  Pry.commands.alias_command _alias, _cmd if Pry.commands[_cmd]
end

%w(hirb).each { |gem| require gem }

Hirb.enable

Pry.config.print = Proc.new do |output, value|
  Hirb::View.view_or_page_output(value) || Pry::DEFAULT_PRINT.call(output, value)
end

# fix for NoMethodError: undefined method `reload!' for main:Object
include Rails::ConsoleMethods if defined? Rails

Pry.config.theme = "solarized"
