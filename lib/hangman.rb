class HangmanGame

  def initialize()
    @guesses = Set.new
  end

  def guess(character)
    @guesses.add(character)
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

