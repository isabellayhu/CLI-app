require_relative "../config/enviroment"

class PlaceCollection
    attr_accessor :places
    
    def initialize(places)
        @places = places
    end

    def find(place_id)
        @places.find do |place|
            place.id == place_id
        end 
    end

    def print
        @places.each do |place|
            puts "Place Name - #{place.name}"
            puts "Place ID - #{place.id}"
            puts
        end
    end

    def self.from_mapbox_response_features(json)
        places = json.collect do |feature|
            attributes = {
                id: feature["id"],
                name: feature["place_name"],
                geocoding: feature["geometry"]["coordinates"]
            }
            Place.new(attributes)
        end
        PlaceCollection.new(places)
    end
end