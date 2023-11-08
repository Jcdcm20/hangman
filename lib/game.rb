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
  show_saved_files
else
  exit()
end

def show_saved_files

end