#
# pry
# pry-coolline
# pry-doc
# pry-remote
# pry-theme
#
if [53290].include?(RUBY_REVISION)
  $LOAD_PATH.concat Dir.glob("#{ENV['HOME']}/.rvm/gems/ruby-#{RUBY_VERSION}@global/gems/*/lib")
end

Pry.config.editor = "vim"

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

#Pry.config.print = Proc.new do |output, value|
#  Hirb::View.view_or_page_output(value) || Pry::DEFAULT_PRINT.call(output, value)
#end

old_print = Pry.config.print

Pry.config.print = Proc.new do |*args|
 Hirb::View.view_or_page_output(args[1]) || old_print.call(*args)
end

# fix for NoMethodError: undefined method `reload!' for main:Object
if defined? Rails
  include Rails::ConsoleMethods if defined?(Rails::ConsoleMethods)
end

if defined? ActiveRecord::Base
  ActiveRecord::Base.logger = Logger.new(STDOUT)
end

Pry.config.theme = "solarized"

Pry.config.coolline_paren_matching = false
