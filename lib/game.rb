require 'yaml'
require_relative 'hangman.rb'

puts 'Welcome to Hangman!'
puts '1 - New Game'
puts '2 - Load Game'
puts '3 - Exit'
op = gets.chomp.to_i

if op == 1
  game = Hangman.new
  game.play
elsif op == 2
  folder = 'saved_games'
  files = Dir.entries(folder).select { |entry| File.file?(File.join(folder, entry))}
  files.each_with_index {|file, index| puts "#{index+1} - #{file}"}
  puts 'Choose a file: '
  op = gets.chomp.to_i - 1
  filepath = "#{folder}/#{files[op]}"
  data = File.open(filepath, 'r') {|test| YAML.load(test)}
  game = Hangman.new(data)
  game.play
else
  exit()
end
