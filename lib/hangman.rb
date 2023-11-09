require 'yaml'

class Hangman
  attr_accessor :word, :incorrect_guesses
  def initialize(seed='')
    if seed == ''
      @word = select_word
      @masked_word = Array.new(word.length, '_')
      @incorrect_guesses = 0
      @guessed_letters = ''
    else
      puts 'test'
  
    end
  end

  def play
    while incorrect_guesses < 7
      show_word
      get_guess
      check
      check_win
      puts 'Want to save and continue later? (y\n)'
      option = gets.chomp

      if option == 'y'
        save
        break
      else
        next
      end
    end
  end

  def select_word
    File.open('google-10000-english-no-swears.txt', 'r') do |file|
      dict = []
      file.each do |line|
        line.chomp!
        if line.length >= 5 && line.length <= 12
          dict.push(line)
        end
      end
      dict[rand(dict.length)]
    end
  end

  def show_word
    @masked_word.each do |letter|
      print "#{letter} "
    end
  end

  def get_guess
    print "\n\nEnter Guess: "
    @guess = gets.chomp.downcase
    if @guess.length > 1
      puts "\nPlease enter just one letter at time."
      get_guess
    end
  end

  def check
    change = 0
    @word.split('').each_with_index do |l, i|
      if l == @guess
        @masked_word[i] = @guess
        change += 1
      end
    end

    if change == 0
      @incorrect_guesses += 1
      puts "\nWrong guess"
      puts "#{7-@incorrect_guesses} left"
    else
      show_word
    end
  end

  def check_win
    if @word == @masked_word.join
      puts "\nYou guessed the whole word"
      show_word
      exit()
    end
  end

  def save
    puts 'Please enter a name for the save file: '
  
    name = gets.chomp!

    f = File.open("saved_games/#{name}.yml", 'w')
    YAML.dump({
      :word => @word,
      :masked_word => @masked_word,
      :incorrect_guesses => @incorrect_guesses,
      :guessed_letters => @guessed_letters
    }, f)
    f.close
  end
end
