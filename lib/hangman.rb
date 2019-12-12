require_relative 'wordpicker'
require 'set'

class HangmanGame
  def self.create
    picker = RandomWordPicker.create
    HangmanGame.new picker
  end

  def self.createNull(word_list = %w(anthill crummy goliath wowza),
                      word_number = 2)
    picker = RandomWordPicker.createNull word_list, word_number
    HangmanGame.new picker
  end

  def initialize(word_picker)
    @word_picker = word_picker
    @guesses = Set.new
  end

  def start
    @word = @word_picker.pick
  end

  def word
    @word
  end

  def guess(character)
    @guesses.add character
  end

  def guesses
    @guesses.to_a
  end
end

def getUnderscores(word)
  displayWord = ''
  word.length.times do |x|
    displayWord += '_'
  end
  displayWord
end

def isCorrect(word, guess)
  word.include? guess
end
