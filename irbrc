require 'rubygems'

if ENV['MY_RUBY_HOME'] && ENV['MY_RUBY_HOME'].include?('rvm')
  begin

    # this enables global gems when using local gemset with bundler
    $LOAD_PATH.concat Dir.glob("#{ENV['HOME']}/.rvm/gems/ruby-#{RUBY_VERSION}-p#{RUBY_PATCHLEVEL}@global/gems/*/lib")

    #require 'rvm'
    if defined?(::Bundler)
      #$LOAD_PATH.concat Dir.glob("#{ENV['rvm_ruby_global_gems_path']}/gems/*/lib")
    end
  rescue LoadError => e
    puts e.message
    # RVM is unavailable at this point.
    raise "RVM ruby lib is currently unavailable."
  end
end

IRB.conf[:PROMPT_MODE]=:CLASSIC


require 'pry'
Pry.start
exit

require 'irb/completion'

def load_gem(name, lib=nil, &block)
  lib = name unless lib
  #Gem.activate(name)
  require lib
  yield if block_given?
rescue Exception => e
  puts "#{e.class}: run sudo gem install #{name}"
end

def rails?
  ENV.include?('RAILS_ENV') or $0 =~ /rails/
end

load_gem 'wirble' do
  Wirble.init
  Wirble.colorize
end

load_gem 'hirb' do
  Hirb.enable
end

load_gem 'sketches' do
  Sketches.config :editor => 'vim'
end

# usage: ap object
load_gem 'awesome_print', 'ap' # awesome_print gem

# usage: lp object
load_gem 'looksee'

class Object
  def local_methods
    self.class.instance_methods(false).sort
  end
end

# или так
#class Object
#  def local_methods(obj = self)
#    (obj.methods - obj.class.superclass.instance_methods).sort
#  end
#end

# найти багу с бандлером и рельсами если не стоят вышеуказанные гемы
if rails?
  # Log to STDOUT if in Rails
  #if rails? && defined? RAILS_DEFAULT_LOGGER
  #end
  #if RAILS_DEFAULT_LOGGER
  puts '==rails=='
  require 'active_record'
  #RAILS_DEFAULT_LOGGER = Logger.new(STDOUT) unless RAILS_DEFAULT_LOGGER
  #end

  def sql(query)
    ActiveRecord::Base.connection.select_all(query)
  end
  # эта хуйня с логами и так включена и нужна для on/off
  def change_log(stream)
    ActiveRecord::Base.logger = Logger.new(stream)
    ActiveRecord::Base.clear_active_connections!
  end
  def show_log
    change_log(STDOUT)
    puts "SQL log enabled. Enter 'reload!' to reload all loaded ActiveRecord classes"
  end
  def hide_log
    change_log(nil)
    puts "SQL log disabled. Enter 'reload!' to reload all loaded ActiveRecord classes"
  end

  change_log STDOUT
end

# time { ... }      # Код выполнится 1 раз
# time(100) { ... } # Код выполнится 100 раз
def time(times = 1)
  require 'benchmark'
  ret = nil
  Benchmark.bm { |x| x.report { times.times { ret = yield } } }
  ret
end
