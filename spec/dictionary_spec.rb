require 'dictionary'

describe Dictionary do
  it 'returns the definition of a word with applicable references' do
    dictionary = Dictionary.new
    expected = {
      :definition => "a collection of letters",
      :see_also => ["//example.us/collection", "//example.com/letter",],
    }
    expect(dictionary.definition('word')).to eq expected
  end
end