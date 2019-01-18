def nyc_pigeon_organizer(data)
  # write your code here!
  pigeon_list = {}
  extract_pigeons(data, pigeon_list)
  set_attribute(data, pigeon_list, :color)
  set_attribute(data, pigeon_list, :gender)
  set_attribute(data, pigeon_list, :lives)
  return pigeon_list
end

def extract_pigeons(data, map)
  data[:lives].each do |k, v|
    v.each {|name| map[name] = {}}
  end
end

def set_attribute(data, map, attr)
  data[attr].each do |attribute, v|
    v.each do |name|
      if map[name][attr]
        map[name][attr] << attribute.to_s
      else
        map[name][attr] = [attribute.to_s]
      end
    end
  end
end