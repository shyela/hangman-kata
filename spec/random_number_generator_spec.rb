require 'random_number_generator'

RSpec.describe 'RandomNumberGenerator' do

  it "should return the specified word from the words file" do
    expected_result = 23

    generator = RandomNumberGenerator.createNull expected_result
    actual = generator.generate_random_number 300

    expect(actual).to eq(expected_result)
  end

end
