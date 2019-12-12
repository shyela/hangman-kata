require 'words_file_reader'

RSpec.describe 'WordsFileReader' do
  FILE_CONTENTS = %w(aa aal aalii aam Aani aardvark aardwolf)

  it "should return the specified word from the words file" do
    word_line_number = 3
    expected_word = "aalii"

    reader = WordsFileReader.createNull FILE_CONTENTS
    word = reader.read_line word_line_number

    expect(word).to eq(expected_word)
  end

  it 'should return the number of lines in the words file' do
    reader = WordsFileReader.createNull FILE_CONTENTS
    actual = reader.num_lines

    expect(actual).to eq(FILE_CONTENTS.length)
  end

end
