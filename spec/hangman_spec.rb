require 'hangman'

RSpec.describe 'Hangman' do

  describe 'display logic' do
    it 'should return underscores for each character in given word' do
      expect(getUnderscores('wordy')).to eq('_____')
    end
  end

  describe 'game logic' do
    it 'give guess and then return true if correct guess' do
      expect(isCorrect('wordy', 'w')).to be_truthy
    end

    it 'give guess and then return false if incorrect guess' do
      expect(isCorrect('wordy', 'x')).to be_falsey
    end
  end

  describe 'game state' do
    describe 'guess logic' do
      it 'should know characters guessed' do
        game = HangmanGame.create
        game.guess('a')
        expect(game.guesses).to include('a')

        game.guess('b')
        expect(game.guesses).to include('a')
        expect(game.guesses).to include('b')
      end

      it 'should starts with no guesses' do
        game = HangmanGame.create
        expect(game.guesses.count).to eq(0)
      end

      it 'should not ignore duplicated guesses' do
        game = HangmanGame.create
        game.guess('a')
        game.guess('a')

        expect(game.guesses).to include('a')
        expect(game.guesses.count).to eq(1)
      end
    end

    describe 'pick word' do
      it 'should pick a word when the game is started' do
        word_list = %w(aardvark coeffect foolish yeoman)
        word_number = 2
        expected_word = 'coeffect'

        game = HangmanGame.createNull word_list, word_number
        game.start

        expect(game.word).to eq(expected_word)
      end

    end
  end

end
