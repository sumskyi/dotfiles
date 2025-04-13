require 'rainbow/refinement'
using Rainbow

# add some gems to $LOAD_PATH which were isolated by bundler
#  - coderay is the dependency of pry
def fill_load_path
  to_load = %w[
    amazing_print
    coderay
    hirber
    pry
    pry-doc
    pry-rails
    pry-remote
    pry-theme
    sketches
  ]

  regexp = Regexp.new("(#{to_load.join('|')})")

  Gem.path.each do |path|
    next unless File.directory?("#{path}/gems")

    Dir.new("#{path}/gems").each do |gem_path|
      next if %w[. ..].any? { |d| gem_path == d } # skip current and parent directory

      new_el = "#{path}/gems/#{gem_path}/lib" # new element to add to $LOAD_PATH

      next if $LOAD_PATH.any? { |el| el == new_el } # already loaded

      $LOAD_PATH << new_el if new_el =~ regexp
    end
  end
end

# benchmark
def time(times = 1)
  require 'benchmark'

  nil.tap do
    Benchmark.bm { |x| x.report { times.times { yield } } }
  end
end

def irb?
  caller(0...1).first.match? /.irbrc/
end

# USAGE:
# location(klass, :method_name) - for class methods
# location(klass.new, :method_name) - for instance methods
def location(klass_or_instance, method_name)
  klass_or_instance
    .method(method_name)
    .source_location
    .join(':')
end

def load_gem(name, lib = nil, &_block)
  lib ||= name
  require lib
  yield if block_given?
rescue LoadError => e
  puts "#{e.class}: run 'gem install #{name}'"
end

fill_load_path

load_gem 'amazing_print' do
  # AmazingPrint.irb! # use ap instead, since I'd  like to use the Hirber by default
  AmazingPrint.pry! # TODO: do not remember why
end

# usage:
#   table [{a: 3, b: 4, c: 5}, {a: 5, b: 4, c: 3}]
#   table User.all
# +---+---+---+
# | a | b | c |
# +---+---+---+
# | 3 | 4 | 5 |
# | 5 | 4 | 3 |
# +---+---+---+
# 2 rows in set
load_gem 'hirber' do
  Hirb.enable
  extend Hirb::Console
end

# usage:
#   sketch :abc - opens named sketch in editor
load_gem 'sketches' do
  Sketches.config editor: 'gvim'
end