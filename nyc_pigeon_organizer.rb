require 'pry'

def nyc_pigeon_organizer(data)
  organized = {}
  pigeon_list = []
  data.each do |attr, attr_list|
    attr_list.each do |attr, names|
      names.each do |name|
        unless pigeon_list.include?(name)
          organized[name] = {}
          pigeon_list << name
        end
      end
    end
  end

  organized.each do |pigeon, attr_list|
    data.each do |attr, values|
      if !attr_list.has_value?(attr)
        attr_list[attr] = []
      end
      data[attr].each do |value, pigeons|
        pigeons.each do |name|
          if pigeon == name
            attr_list[attr] << value.to_s
          end
        end
      end
    end
  end
  organized
end

# def nyc_pigeon_organizer(data)
#   pigeon_hash = data
#   pigeon_hash.each_with_object({}) do |(key, hash), result|
#     hash.each do |attribute, names|
#       names.each do |name|
#         result[name] ||= {}
#         result[name][key] ||= []
#         result[name][key] << attribute.to_s
#       end
#     end
#   end
# end
