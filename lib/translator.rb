# require modules here
require "pry"
def load_library(file_path)
  emoticons_newhash = { }
  require 'yaml'
  emoticons_hash = YAML.load(File.read(file_path))
  emoticons_hash.each { |key,value|
  emoticons_newhash.store(key,{:english=>value[0],:japanese=>value[1]})
  }
emoticons_newhash
end

def get_japanese_emoticon(file_path, emoticon)
 emoticons_newhash = load_library(file_path)
emojis = [ ]
 emoticons_newhash.each {|language, emoji|
  emoji.each {|inner_key,inner_value|
    emojis.push(inner_value)
  }
 }
  if (emojis.include?(emoticon))
  emojiss = emoticons_newhash.select{|key, hash| hash[:english] == emoticon }
  meaning = emojiss.keys[0]
  emojiss[meaning][:japanese]
  else
  p "Sorry, that emoticon was not found"
  end
end


def get_english_meaning(file_path, emoticon)
 emoticons_newhash = load_library(file_path)
  emojis = [ ]
  emoticons_newhash.each {|language, emoji|
  emoji.each {|inner_key,inner_value|
    emojis.push(inner_value)
  }
 }
  if (emojis.include?(emoticon))
  emojiss = emoticons_newhash.select{|key, hash| hash[:japanese] == emoticon }
  p emojiss.keys[0]
  else
  p "Sorry, that emoticon was not found"
  end
end
#binding.pry
