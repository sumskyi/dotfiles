linkables = %w(
  .ackrc
  .alias
  .gemrc
  .git
  .gitconfig
  .gitignore
  .i3status.conf
  .irbrc
  .pryrc
  .rvmrc
  .vimrc
  .zshrc
)

desc "symlink config files"
task :symlink do
  skip_all = false
  overwrite_all = false
  backup_all = false

  linkables.each do |file|
    source = "#{ENV["PWD"]}/#{file}"
    target = "#{ENV["HOME"]}/#{file}"

    if File.exists?(target) || File.symlink?(target)
      unless skip_all || overwrite_all || backup_all
        puts "File already exists: #{target}, what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all"
        case STDIN.gets.chomp
        when 'o' then overwrite = true
        when 'b' then backup = true
        when 'O' then overwrite_all = true
        when 'B' then backup_all = true
        when 'S' then skip_all = true
        end
      end

      FileUtils.rm_rf(target) if overwrite || overwrite_all
      run %{ mv "$HOME/#{file}" "$HOME/#{file}.backup" } if backup || backup_all
    end

    run %{ ln -s "#{source}" "#{target}" }
  end

  message("symlink finished")
end

task :default => 'symlink'

private

def run(cmd)
  puts "[Running] #{cmd}"
  `#{cmd}` unless ENV['DEBUG']
end

def message(action)
  puts "Done #{action}"
end
