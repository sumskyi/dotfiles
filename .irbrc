to_load = %w[
  awesome_print
  coderay
  hirb
  pry
  pry-doc
  pry-remote
  pry-theme
  sketches
  slop
  yard
].join('|')

regexp = Regexp.new( "(#{to_load})" )

Gem.path.each do |path|
  next unless File.directory?("#{path}/gems")

  Dir.new("#{path}/gems").each do |gem_path|
    next if %w[ . .. ].any?{ |d| gem_path == d }

    new_el = "#{path}/gems/#{gem_path}/lib"
    $LOAD_PATH << new_el if new_el =~ regexp
  end
end

def load_gem(name, lib=nil, &block)
  lib = name unless lib
  #Gem.activate(name)
  require lib
  yield if block_given?
rescue LoadError => e
  puts "#{e.class}: run 'gem install #{name}'"
end

load_gem 'hirb' do
  Hirb.enable
  extend Hirb::Console
end

load_gem 'sketches' do
  Sketches.config :editor => 'gvim'
end

load_gem 'awesome_print' do
  AwesomePrint.irb!
end

load_gem 'pry' do
  Pry.start
end

# time { ... }      # Код выполнится 1 раз
# time(100) { ... } # Код выполнится 100 раз
def time(times = 1)
  require 'benchmark'
  ret = nil
  Benchmark.bm { |x| x.report { times.times { ret = yield } } }
  ret
end
