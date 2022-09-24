require_relative "../config/enviroment"

class Place     
    def initialize(attributes)
        attributes.each do |key, value|
            self.class.attr_accessor(key)
            self.send(("#{key}="), value)
        end
    end
end