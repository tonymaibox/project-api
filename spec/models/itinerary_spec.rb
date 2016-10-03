require 'rails_helper'

describe Itinerary, type: :model do
let(:itinerary1) { Itinerary.new(name: "Trip through NYC") }
let(:itinerary2) { Itinerary.new() }
let(:day1) { Day.new(day: 1) }
let(:location1) { Location.new(city: "New York City") }
let(:activity1) { Activity.new(name: "Shopping") }

  it 'is valid with a name' do
    expect(itinerary1).to be_valid
    expect(itinerary1.name).to eq("Trip through NYC")
    itinerary2.valid?
    expect(itinerary2.errors[:name]).to include("can't be blank")
  end

  it 'is valid with a unique name' do
    itinerary1.save
    expect(itinerary1).to be_valid
    itinerary2.valid?
    expect(itinerary2.errors[:name]).to include("has already been taken")
  end

  it "should have a #locations method that returns a collection of locations associated to that itinerary" do
    itinerary1.days << day1
    itinerary1.days.first.locations << location1
    expect(itinerary1.locations.count).to be(1)
    expect(itinerary1.locations).to include(location1)
  end

  it "should have a #activities method that returns a collection of activities associated to that itinerary" do
    itinerary1.days << day1
    itinerary1.days.first.locations << location1
    itinerary1.days.first.locations.first.activities << activity1
    expect(itinerary1.activities.count).to be(1)
    expect(itinerary1.activities).to include(activity1)
  end

end
