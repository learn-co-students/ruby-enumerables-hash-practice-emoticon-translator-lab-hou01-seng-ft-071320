require 'pry'
require 'yaml'

def load_library(file)
  emoticons = YAML.load_file('lib/emoticons.yml')
  
  emoticons.transform_values do |values|
      {
         :english => values[0],
         :japanese => values[1]
      }
    
  end
  
end

def get_english_meaning(file_path, emoticon)
  library = load_library(file_path)
  library.each do |meaning, idiom|
    return meaning if idiom[:japanese] == emoticon
  end
   "Sorry, that emoticon was not found"
end

def get_japanese_emoticon(file_path, emoticon)
  library = load_library(file_path)
  library.each do |meaning, idiom|
    return idiom[:japanese] if idiom[:english] == emoticon
  end
  "Sorry, that emoticon was not found"
end
  
