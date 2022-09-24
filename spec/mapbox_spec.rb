require_relative "./spec_helper"

RSpec.describe Mapbox, "#search" do
    it "fetches a list of places with search text" do
        # Arrange

        # Act
        place_collection = Mapbox.search("sydney")

        # Assert
        expect(place_collection.places.length).to be > 0
        place_collection.places.each do |place|
            expect(place).to be_a_kind_of Place
        end
    end
end