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
  saves = Dir.entries("saved_games")
  c = 1
  saves.each do |file|
    unless file == '.' || file == '..'
      puts "#{c} - #{file}"
      c += 1
    end
  end
  puts 'Please choose a save file'
  save = gets.chomp.to_i

  game = Hangman.new(save)
  game.play
else
  exit()
end
