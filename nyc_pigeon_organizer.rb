def nyc_pigeon_organizer(data)
  # example code calls this "pigeon_list" but I think it's distracting to refer
  # to a hash as a "list"
  reorganized_pigeons = {}
  data.each do |field, attribute_hash|
    attribute_hash.each do |attribute, pigeons|
      # some attributes start out as symbols (e.g. :purple) but the output
      # format requires them to be strings (e.g. "purple")
      attribute = attribute.to_s
      pigeons.each do |pigeon|
        if !reorganized_pigeons.keys.include?(pigeon)
          # if the pigeon wasn't there before, we can just add the field and
          # attribute to the hash without worrying about overwriting anything
          reorganized_pigeons[pigeon] = {field => [attribute]}
        else
          # if the pigeon has already been added, check if the field has already
          # been added, too. if it has, shovel in the new attribute. if not,
          # add it to the hash and make a new attribute list.
          pigeon_hash = reorganized_pigeons[pigeon]
          if pigeon_hash.keys.include?(field)
            pigeon_hash[field] << attribute
          else
            pigeon_hash[field] = [attribute]
          end
        end
      end # end of pigeons.each
    end   # end of attribute_hash.each
  end     # end of data.each

  return reorganized_pigeons
end
