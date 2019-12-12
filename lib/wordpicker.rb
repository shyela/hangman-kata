require_relative 'words_file_reader'
require_relative 'random_number_generator'

class RandomWordPicker

  def self.create
    file_reader = WordsFileReader.create
    number_generator = RandomNumberGenerator.create
    RandomWordPicker.new file_reader, number_generator
  end

  def self.createNull(word_list = nil, word_number = nil)
    file_reader = word_list.nil? ? WordsFileReader.createNull : WordsFileReader.createNull(word_list)
    number_generator = word_number.nil? ? RandomNumberGenerator.createNull : RandomNumberGenerator.createNull(word_number)
    RandomWordPicker.new file_reader, number_generator
  end

  def initialize(file_reader, number_generator)
    @file_reader = file_reader
    @number_generator = number_generator
  end

  def pick
    num_lines = @file_reader.num_lines
    line_number = @number_generator.generate_random_number num_lines
    @file_reader.read_line line_number
  end

end
