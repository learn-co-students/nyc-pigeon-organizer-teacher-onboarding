require "pry"
test_data = {
  :color => {
    :purple => ["Theo", "Peter Jr.", "Lucky"],
    :grey => ["Theo", "Peter Jr.", "Ms. K"],
    :white => ["Queenie", "Andrew", "Ms. K", "Alex"],
    :brown => ["Queenie", "Alex"]
  },
  :gender => {
    :male => ["Alex", "Theo", "Peter Jr.", "Andrew", "Lucky"],
    :female => ["Queenie", "Ms. K"]
  },
  :lives => {
    "Subway" => ["Theo", "Queenie"],
    "Central Park" => ["Alex", "Ms. K", "Lucky"],
    "Library" => ["Peter Jr."],
    "City Hall" => ["Andrew"]
  }
}
test_data_goal ={
  "Theo" => {
    :color => ["purple", "grey"],
    :gender => ["male"],
    :lives => ["Subway"]
  },
  "Peter Jr." => {
    :color => ["purple", "grey"],
    :gender => ["male"],
    :lives => ["Library"]
  },
  "Lucky" => {
    :color => ["purple"],
    :gender => ["male"],
    :lives => ["Central Park"]
  },
  "Ms .K" => {
    :color => ["grey", "white"],
    :gender => ["female"],
    :lives => ["Central Park"]
  },
  "Queenie" => {
    :color => ["white", "brown"],
    :gender => ["female"],
    :lives => ["Subway"]
  },
  "Andrew" => {
    :color => ["white"],
    :gender => ["male"],
    :lives => ["City Hall"]
  },
  "Alex" => {
    :color => ["white", "brown"],
    :gender => ["male"],
    :lives => ["Central Park"]
  }
}

def nyc_pigeon_organizer(data)
  # write your code here!
  pigeon_name_hash = {}
  data.each do |trait, values|
    values.each do |value, names|
      names.each do |name|
        # binding.pry
        if pigeon_name_hash.key?(name) == false
          pigeon_name_hash[name] = {}
          pigeon_name_hash[name][trait] = [value.to_s]
        else
          if pigeon_name_hash[name][trait] == nil
            pigeon_name_hash[name][trait] = [value.to_s]
          else 
            pigeon_name_hash[name][trait] << value.to_s
          end
        end
      end
    end
  end
  return pigeon_name_hash
end

# nyc_pigeon_organizer(test_data)