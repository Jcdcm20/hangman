class Hangman
  attr_accessor :word
  def initialize
    @word = pick_word
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
end

game = Hangman.new
puts game.word