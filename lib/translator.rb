# require modules here
require "yaml"

def load_library(file_path)
  # Load the emoticons.yml file
  emoticons = YAML.load_file(file_path)
  
  # emoticons are now a hash like {"angel"=>["O:)", "☜(⌒▽⌒)☞"],
  # We need to pivot this data so its like "angel" => english => emoticons
  # Create new hash to store english and japanese keys
  new_emoticons = {}
  
  # Loop over the emoticons loaded from the file and store each key in the new hash
  emoticons.each do |key, value|
    # value is an array with english meaning in index 0, and japanese meaning in index 1.
    new_emoticons[key] = {:english => value[0], :japanese => value[1]}
  end
  new_emoticons
end

def get_japanese_emoticon(file_path, user_emoticon)
  # Get emoticons from file_path
  emoticons = load_library(file_path)
  
  #the user gives this function an emoticon to look up.  We need to return the japanese meaning of the emoticon, but we are not sure which emoticon it is.
  
  # Create a variable to store the japanese emoticon if found.  default it to what it should say if not found.
  japanese_emoticon = "Sorry, that emoticon was not found"
  
  # We will need to loop over each of the emoticons in the hash and find the key that contains the proper english emoticons
  emoticons.each do |parent_key, parent_value|
    # parent_key will be 'happy', 'angel', 'bored', emoticons
    # parent_value will be a dictionary with english and japanese as keys and arrays as values.
    if user_emoticon == parent_value[:english]
      
      # english emoticon found, store the japanese translation.
      japanese_emoticon = parent_value[:japanese]
      
      # since we found the correct value, we can break out of this loop.
      break
    end
  end
  japanese_emoticon
end

def get_english_meaning(file_path, user_emoticon)
  # Get emoticons from file_path
  emoticons = load_library(file_path)
  
  #the user gives this function an emoticon to look up.  We need to return the english meaning of the emoticon, but we are not sure which emoticon it is.
  
  # Create a variable to store the english emoticon if found.  default it to what it should say if not found.
  english_emoticon = "Sorry, that emoticon was not found"
  
  # We will need to loop over each of the emoticons in the hash and find the key that contains the proper japanese emoticons
  emoticons.each do |parent_key, parent_value|
    # parent_key will be 'happy', 'angel', 'bored', emoticons
    # parent_value will be a dictionary with english and japanese as keys and arrays as validates_uniqueness_of
    if user_emoticon == parent_value[:japanese]
      
      # japanese emoticon found, store the english translation.
      english_emoticon = parent_key
      
      # since we found the correct value, we can break out of this loop.
      break
    end
  end
  english_emoticon
end