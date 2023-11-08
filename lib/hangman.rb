class Hangman
  attr_accessor :word, :incorrect_guesses
  def initialize
    @word = select_word
    @masked_word = Array.new(word.length, '_')
    @incorrect_guesses = 0
    @guessed_letters = ''
  end

  def play
    while incorrect_guesses < 7
      show_word
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
    puts @word
  end
end
