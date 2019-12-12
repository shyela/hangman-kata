class WordsFileReader
  WORDS_FILE = '/usr/share/dict/words'

  def self.create
    WordsFileReader.new File
  end

  def self.createNull(file_contents = %w(millennial nincompoop philately))
    file_module = NullFileModule.new file_contents
    WordsFileReader.new file_module
  end

  def initialize(file_module)
    @file_module = file_module
  end

  def read_line(line_number)
    word = nil
    @file_module.open(WORDS_FILE, "r") do |file|
      line_number.times { word = file.gets }
    end
    word.tr("\n", "") if word
  end

  def num_lines
    @file_module.foreach(WORDS_FILE).reduce(0) { |c, line| c + 1 }
  end
end

class NullFileModule
  def initialize(file_contents)
    @file_contents = file_contents
  end

  def open(file_name, perms)
    fake_file = Class.new do
      def initialize(file_contents)
        @file_contents = file_contents
        @file_index = 0
      end

      def gets
        @file_index += 1
        @file_contents[@file_index - 1]
      end
    end.new @file_contents

    yield fake_file
  end

  def foreach(file_name)
    @file_contents
  end
end
