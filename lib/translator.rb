# require modules here
require 'pry'


def load_library(file_path)
  # code goes here
  require 'yaml'
  emoticon = YAML.load_file(file_path)
  emoticon_newhash = {}
  emoticon.each do |key, value|
    emoticon_newhash.store(key, {:english => value[0], :japanese => value[1]})
  
    
  end
  emoticon_newhash

end



def get_japanese_emoticon(file_path, western_emoticon)
  # code goes here
  
  
  
  emoticon = load_library(file_path)
  japanese_emoticon = "Sorry, that emoticon was not found"
  
  emoticon_translate = emoticon.select{|key, hash|hash[:english] == western_emoticon}
  
   if emoticon_translate != {}
     emoticon_translate.each do |inner_k, inner_v|
       japanese_emoticon = emoticon_translate[inner_k][:japanese]
    
    end
  end
  
  
japanese_emoticon
  
  
end


def get_english_meaning(file_path, japanese_emoticon)
  # code goes here
  
  emoticon = load_library(file_path)
  english_emoticon = "Sorry, that emoticon was not found"
  
  emoticon_translate = emoticon.select{|key, hash|hash[:japanese] == japanese_emoticon}
  
  
   if emoticon_translate != {}
     emoticon_translate.each do |inner_k, inner_v|
       english_emoticon = inner_k
    
    end
  end
english_emoticon
end