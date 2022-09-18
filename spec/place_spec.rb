require_relative "./spec_helper"

RSpec.describe Place, "#initialize" do
    it "initializes a new object of the Place class with the given attributes" do
        # Arrange
        attributes = {
            "id": "place.24496142",
            "type": "Feature",
            "place_type": [
                "place"
            ],
            "relevance": 1,
            "properties": {
                "wikidata": "Q3130"
            },
            "text": "Sydney",
            "place_name": "Sydney, New South Wales, Australia",
            "bbox": [
                150.520928608,
                -34.118344992,
                151.343020992,
                -33.578140996
            ],
            "center": [
                151.21,
                -33.868
            ],
            "geometry": {
                "type": "Point",
                "coordinates": [
                    151.21,
                    -33.868
                ]
            },
            "context": [
                {
                    "id": "region.19913417492553050",
                    "short_code": "AU-NSW",
                    "wikidata": "Q3224",
                    "text": "New South Wales"
                },
                {
                    "id": "country.5736064365346070",
                    "wikidata": "Q408",
                    "short_code": "au",
                    "text": "Australia"
                }
            ] 
        }
        # Act
        sydney = Place.new(attributes)

        # Assert
        expect(sydney.place_name).to eq "Sydney, New South Wales, Australia"
    end
end