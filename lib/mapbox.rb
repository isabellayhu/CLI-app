require_relative "../config/enviroment"

class Mapbox
    Token = "pk.eyJ1IjoiaXNhYmVsbGEtaHUiLCJhIjoiY2wzZnFiOHlhMDJ3YzNjbGp4NWEzMWtndiJ9.kVgtyWuoNZESQuCvX0jkIA"

    def self.search(search_text)
        url = "https://api.mapbox.com/geocoding/v5/mapbox.places/#{search_text}.json?access_token=#{Token}"
        uri = URI.parse(url)

        response = Net::HTTP.get_response(uri)
        response_json = JSON.parse(response.body)

        PlaceCollection.from_mapbox_response_features(response_json["features"])
    end
end
