require_relative 'lib/hangman'

if __FILE__ == $0
  game = HangmanGame.new
  game.start
  puts "Word = #{game.word}"
end
