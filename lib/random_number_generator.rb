class RandomNumberGenerator
  def self.create
    RandomNumberGenerator.new Random.new
  end

  def self.createNull(result = 3)
    random = NullRandom.new result
    RandomNumberGenerator.new random
  end

  def initialize(random)
    @random = random
  end

  def generate_random_number(max_value)
    @random.rand max_value
  end
end

class NullRandom
  def initialize(result)
    @result = result
  end

  def rand(max)
    if @result > max
      raise ArgumentError.new 'result is larger than max value'
    end
    @result
  end
end

