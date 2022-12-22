# frozen_string_literal: true

#
# pry
# pry-coolline
# pry-doc
# pry-remote
# pry-theme
#

Pry.config.editor = 'vim'

# Pry.hooks.add_hook(:after_session, :say_bye) do
#   puts 'fuck off Gnida'
# end

# warning: setting prompt with help of
# `Pry.config.prompt = [proc {}, proc {}]` is deprecated.
# Use Pry::Prompt API instead
Pry.config.prompt = Pry::Prompt.new(
  'custom',
  'my custom prompt',
  [
    proc { |obj, nest_level| "#{RUBY_VERSION}-#{RUBY_PATCHLEVEL} (#{obj}):#{nest_level} > " },
    proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} * " }
  ]
)
Pry.config.prompt = Pry::Prompt[:rails] if Pry::Prompt[:rails]

cmd_aliases = {
  'continue' => 'c',
  'step' => 's',
  'next' => 'n'
}

cmd_aliases.each do |cmd, alias_|
  Pry.commands.alias_command alias_, cmd if Pry.commands[cmd]
end

# pry-coolline
%w[
  awesome_print
  hirb
  pry-doc
  pry-remote
  pry-theme
].each { |gem| require gem }

AwesomePrint.pry!

Hirb.enable

# Pry.config.print = Proc.new do |output, value|
#   Hirb::View.view_or_page_output(value) || Pry::DEFAULT_PRINT.call(output, value)
# end

old_print = Pry.config.print

Pry.config.print = proc do |*args|
  Hirb::View.view_or_page_output(args[1]) || old_print.call(*args)
end

# fix for NoMethodError: undefined method `reload!' for main:Object
# include Rails::ConsoleMethods # if defined?(Rails::ConsoleMethods)

ActiveRecord::Base.logger = Logger.new($stdout) if defined? ActiveRecord::Base

Pry.config.theme = 'solarized'

# Pry.config.coolline_paren_matching = false
