require 'wordpicker'

RSpec.describe 'WordPicker' do
  WORD_LIST = %W(foolish lollipop nonsense)

  it "should pick a word from a file" do
    expected_word_number = 3
    expected_word = "nonsense"
    file_reader = WordsFileReader.createNull(WORD_LIST)
    number_generator = RandomNumberGenerator.createNull(expected_word_number)

    picker = RandomWordPicker.createNull(file_reader, number_generator)
    word = picker.pick

    expect(word).to eq(expected_word)
  end

end
