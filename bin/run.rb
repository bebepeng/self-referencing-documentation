require_relative '../lib/dictionary'
require 'json'

json = File.read('../data/dictionary.json')
dictionary = Dictionary.new(JSON.parse(json))
p dictionary.definition("word")