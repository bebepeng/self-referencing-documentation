class Dictionary
  attr_reader :references

  def initialize(references)
   @references = references
  end

  def definition(word)
    description = references[word]["definition"].gsub("{", "").gsub("}", "")
    linked_words = references[word]["definition"].scan(/{(\w+)}/).flatten
    see_also = linked_words.map do |linked_word|
      if references[linked_word]
        references[linked_word]["url"]
      else
        references[linked_word.chop]["url"]
      end
    end
    {:definition => description, :see_also => see_also}
  end
end