require_relative "./spec_helper"

RSpec.describe Place, "#initialize" do
    it "initializes a new object of the Place class with the given attributes" do
        # Arrange
        attributes = {
            id: "place.24496142",
            name: "Sydney, New South Wales, Australia",
            geocoding: {
                "type": "Point",
                "coordinates": [
                    151.21,
                    -33.868
                ]
            },
        }
        # Act
        sydney = Place.new(attributes)

        # Assert
        expect(sydney.name).to eq "Sydney, New South Wales, Australia"
    end
end

RSpec.describe Place, "#list_places_with_search_text" do
    it "fetches a list of places with search text" do
        # Arrange

        # Act
        places = Place.list_places_with_search_text("sydney")

        # Assert
        expect(places.length).to be > 0
        places.each do |place|
            expect(place).to be_a_kind_of Place
        end
    end
end

RSpec.describe Place, "#get_place_details" do
    it "fetches the details of a place given an id" do
        # Arrange

        # Act
        place = Place.get_place_details("place.24496142")

        # Assert
        expect(place.length).to eq 1
        expect(place[0].name).to eq "Sydney"
    end
end
