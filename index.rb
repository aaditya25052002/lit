# frozen_string_literal: true

require 'optparse'
options = {}

parser = OptionParser.new do |opts|
  opts.banner = 'Usage: mygit [command] [options]'

  opts.separator "\nCommands:"
  opts.separator '    init       Initialize a new repository'
  opts.separator '    add        Add file contents to the index'
  opts.separator '    commit     Record changes to the repository'

  opts.separator "\nOptions:"
  opts.on('-v', '--version', 'Show version') do
    puts 'mygit version 0.1.0'
    exit
  end
  opts.on('-h', '--help', 'Display this help') do
    puts opts
    exit
  end
end

begin
  parser.order!(ARGV)
rescue OptionParser::InvalidOption => e
  puts e
  puts parser
  exit 1
end

command = ARGV.shift
case command
when 'init'
  # TODO: Implement init logic
  puts 'Initializing repository...'
when 'add'
  # TODO: Implement add logic, e.g., files = ARGV
  files = ARGV
  puts "Adding: #{files.join(', ')}"
when 'commit'
  # TODO: Implement commit logic, e.g., message option
  commit_parser = OptionParser.new do |c|
    c.on('-m MESSAGE', '--message=MESSAGE', 'Commit message') do |msg|
      options[:message] = msg
    end
  end
  commit_parser.parse!(ARGV)
  puts "Committing with message: #{options[:message]}"
else
  puts parser
  exit 1
end
