require 'rails_helper'

describe Location, type: :model do

  let(:itinerary1) { Itinerary.new(name: "Trip through NYC") }
  let(:day1) { Day.new(day: 1) }
  let(:location1) { Location.new(city: "New York City") }
  let(:location2) { Location.new() }

  it "is valid with a 'city' attribute" do
    expect(location1).to be_valid
    expect(location1.city).to eq("New York City")
    location2.valid?
    expect(location2.errors[:city]).to include("can't be blank")
  end

  it "should have an #itineraries method that returns a collection of itineraries associated to that location" do
    location1.days << day1
    location1.days.first.itineraries << itinerary1
    expect(location1.itineraries.count).to be(1)
    expect(location1.itineraries).to include(itinerary1)
  end

end
