require 'dictionary'

describe Dictionary do
  it 'returns the definition of a word with applicable references if the reference is singular' do
    data = {"word" => {"definition" => "a {collection} of letters",
                       "url" => "//example.com/word"},
            "collection" => {"definition" => "a group of things or {people}", "url" => "//example.us/collection"},
    }
    dictionary = Dictionary.new(data)
    expected = {
      :definition => "a collection of letters",
      :see_also => ["//example.us/collection"]
    }
    expect(dictionary.definition('word')).to eq expected
  end

  it 'returns the definition of a word with applicable references if the reference is plural' do
    data = {"word" => {"definition" => "a collection of {letters}",
                       "url" => "//example.com/word"},
            "letter" => {"definition" => "a {character} representing one or more of the {sounds} used in speech; any of the symbols of an alphabet", "url" => "//example.com/letter"},
    }
    dictionary = Dictionary.new(data)
    expected = {
      :definition => "a collection of letters",
      :see_also => ["//example.com/letter"]
    }
    expect(dictionary.definition('word')).to eq expected
  end
end
