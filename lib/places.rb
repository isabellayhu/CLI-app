require_relative "../config/enviroment"

class Place
    
    Token = "pk.eyJ1IjoiaXNhYmVsbGEtaHUiLCJhIjoiY2wzZnFiOHlhMDJ3YzNjbGp4NWEzMWtndiJ9.kVgtyWuoNZESQuCvX0jkIA"
    
    def initialize(attributes)
        attributes.each do |key, value|
            self.class.attr_accessor(key)
            self.send(("#{key}="), value)
        end
    end

    def self.list_places_with_search_text(search_text)
        make_request_and_parse_response(search_text)
    end

    def self.get_place_details(id)
        make_request_and_parse_response(id)
    end

    private
    
    def self.make_request_and_parse_response(search_parameter)
        url = "https://api.mapbox.com/geocoding/v5/mapbox.places/#{search_parameter}.json?access_token=#{Token}"
        uri = URI.parse(url)

        response = Net::HTTP.get_response(uri)
        response_json = JSON.parse(response.body)

        places = response_json["features"].collect do |feature|
            attributes = {
                id: feature["id"],
                name: feature["place_name"],
                geocoding: feature["geometry"]
            }
            Place.new(attributes)
        end
    end
end