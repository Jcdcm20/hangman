word = ''

File.open('google-10000-english-no-swears.txt', 'r') do |file|
  dict = []
  file.each do |line|
    line.chomp!
    if line.length >= 5 && line.length <= 12
      dict.push(line)
    end
  end
  r = rand(dict.length)

  word = dict[r]
end

puts word