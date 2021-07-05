# require modules here
require 'yaml'
require 'pry'

def load_library(file_path)
  result = YAML.load_file(file_path).each_with_object({}) do |(key, value), final_hash|
      if !final_hash[key]
        final_hash[key] = {
          :english => value[0],
          :japanese => value[1]
        }
      end
    result
  end
end

def get_japanese_emoticon(file_path,eng_emoji)
  response = 'Sorry, that emoticon was not found'
  load_library(file_path).each do |key,value|
    if value[:english] == eng_emoji
        response = value[:japanese]
    end
  end
  response
end

def get_english_meaning(file_path,jap_emoji)
  response = 'Sorry, that emoticon was not found'
  load_library(file_path).each do |key,value|
    if value[:japanese] == jap_emoji
        response = key
    end
  end
  response
end
