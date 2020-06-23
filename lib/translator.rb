# require modules here
require "yaml"
file_in = "lib/emoticons.yml"
ee = "(#^.^#)"
ff = ":O"
def load_library(file_in)
  emoticons = YAML.load_file(file_in)
  emoticons_sort = {}
  emoticons.each do |emotions, emote|
    #puts emoticons[emotions][0]
    #puts emoticons[emotions][1]
    if !emoticons_sort[emotions]
      emoticons_sort[emotions] = {}
    end
    emoticons_sort[emotions][:english] =  emoticons[emotions][0]
    emoticons_sort[emotions][:japanese] = emoticons[emotions][1]
  end
  #puts emoticons_sort
  emoticons_sort
end

def get_japanese_emoticon(file_in, eng_emote)
  emoticons_sort = load_library(file_in)
  japanese_translation = ""
    emoticons_sort.each do |key1, value1|
      if value1[:english] == eng_emote
        japanese_translation = value1[:japanese]
      end
    end
  if japanese_translation == ""
    japanese_translation = "Sorry, that emoticon was not found"
  end
  japanese_translation
end

def get_english_meaning(file_in, jap_emote)
  emoticons_sort = load_library(file_in)
  english_meaning = ""
    emoticons_sort.each do |key1, value1|
      if value1[:japanese] == jap_emote
        english_meaning = key1
      end
    end
  if english_meaning == ""
    english_meaning = "Sorry, that emoticon was not found"
  end
  english_meaning
end

