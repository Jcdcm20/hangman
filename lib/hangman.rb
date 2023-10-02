class Hangman
  attr_accessor :word, :incorrect_guesses

  def initialize
    @word = pick_word
    @masked_word = Array.new(word.length, '_')
    @incorrect_guesses = 0
    @guessed_letters = ''
  end
  
  def play
    while incorrect_guesses < 7
      show_word
      get_guess
      check_attempt
    end
    puts word
  end

  def pick_word
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

  def get_guess
    puts "\n\n"
    @guess = gets.chomp.downcase
    if @guess.length > 1
      puts 'Please enter just one letter'
      get_guess
    end
  end

  def show_word
    @masked_word.each do |letter|
      print "#{letter} "
    end
  end

  def check_attempt
    change = 0
    @word.split('').each_with_index do |l, i|
      if l == @guess
        @masked_word[i] = @guess
        change += 1
      end
    end

    if change == 0
      @incorrect_guesses += 1
    end
  end
end

game = Hangman.new
game.play