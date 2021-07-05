# require modules here
require 'pry'

def load_library(file_path)
  # code goes here
  
  require "yaml"
  emoticons = YAML.load_file(file_path)
  hash = emoticons
    hash.each do |k,v|
    v.unshift(:english)
    v.insert(2,:japanese)
    end
  hash2 = hash.map {|k,v| [k, Hash[*v] ] }.to_h  
  hash2

end

def get_japanese_emoticon(file_path, western_emoticon)
  # code goes here
  load_library(file_path)
  emoticon_hash = load_library(file_path)
  japanese_emoticon = "Sorry, that emoticon was not found"
  
  emoticon_match = emoticon_hash.select{|key, hash| hash[:english] == western_emoticon}
    if emoticon_match != {}
      emoticon_match.each do |k,v|
      japanese_emoticon = emoticon_match[k][:japanese]
    end
  end
japanese_emoticon  
end



def get_english_meaning(file_path, japanese_emoticon)
  # code goes here
 emoticon_hash = load_library(file_path)
 english_meaning = "Sorry, that emoticon was not found"
  
  emoticon_match = emoticon_hash.select{|key, hash| hash[:japanese] == japanese_emoticon}
    if emoticon_match != {}
      emoticon_match.each do |k,v|
      english_meaning = k
    end
  end
english_meaning  
end