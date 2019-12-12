require 'wordpicker'

RSpec.describe 'WordPicker' do

  it "should pick a word from a file" do
    expected_word_number = 3
    expected_word = "foolish"

    #picker = RandomWordPicker.createNull WORD_LIST, expected_word_number
    picker = RandomWordPicker.createNull
    word = picker.pick

    expect(word).to eq(expected_word)
  end

end
