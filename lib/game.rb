require 'yaml'
require_relative 'hangman.rb'

puts 'Welcome to Hangman!'
puts '1 - New Game'
puts '2 - Load Game'
puts '3 - Exit'
op = gets.chomp.to_i


def load
  directory = Dir.entries("saved_games")
  saves = []
  directory.each do |file|
    unless file == '.' || file == '..'
      saves.append(file)
    end
  end
  c = 1
  saves.each do |save|
    puts "#{c} - #{save}"
  end

  puts 'Please choose a save file: '
  file = gets.chomp.to_i - 1

  data = YAML.load(saves[file])
  puts data[:word]
end

if op == 1
  game = Hangman.new
  game.play
elsif op == 2
  load
else
  exit()
end
