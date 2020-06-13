# require modules here
require 'yaml'
require 'pry'
def load_library(emotes)
emote = YAML.load_file(emotes)
ej_hash = {}

emote.each do |key , value|
  ej_hash[key]  = {}
  ej_hash[key][:english]  = value[0]  #assigning 1st ele (O:))
  ej_hash[key][:japanese] = value[1]  #assigning 2nd ele from angel array
end
p ej_hash
end

def get_english_meaning(file, emote)
  library = load_library(file)
    emote = library.keys.find do |key|
    library[key][:japanese] == emote
  end
  emote ? emote : "Sorry, that emoticon was not found"
end

def get_japanese_emoticon(file, emote)
    library = load_library(file)
  emote = library.keys.find do |key|
    library[key][:english] == emote
  end
  emote ? library[emote][:japanese] : "Sorry, that emoticon was not found"
end