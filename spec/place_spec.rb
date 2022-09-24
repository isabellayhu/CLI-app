require_relative "./spec_helper"

RSpec.describe Place, "#initialize" do
    it "initializes a new object of the Place class with the given attributes" do
        # Arrange
        attributes = {
            id: "place.24496142",
            name: "Sydney, New South Wales, Australia",
            geocoding: [151.21, -33.868],
        }
        # Act
        sydney = Place.new(attributes)

        # Assert
        expect(sydney.name).to eq "Sydney, New South Wales, Australia"
    end
end