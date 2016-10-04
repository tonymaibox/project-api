require 'rails_helper'

describe Activity, type: :model do

  let(:itinerary1) { Itinerary.new(name: "Trip through NYC") }
  let(:day1) { Day.new(day: 1) }
  let(:location1) { Location.new(city: "New York City") }
  let(:activity1) { Activity.new(name: "Shopping") }
  let(:activity2) { Activity.new() }
  let(:user1) { User.new(username: "vronnieli", first_name: "veronica", last_name: "li", email: "vronnieli@mail.com", password: "password") }

  it "is valid with a 'name' attribute" do
    expect(activity1).to be_valid
    expect(activity1.name).to eq("Shopping")
    activity2.valid?
    expect(activity2.errors[:name]).to include("can't be blank")
  end

  it "should have an #itineraries method that returns a collection of itineraries associated to that activity" do
    activity1.locations << location1
    activity1.locations.first.days << day1
    activity1.locations.first.days.first.itineraries << itinerary1
    expect(activity1.itineraries.count).to be(1)
    expect(activity1.itineraries).to include(itinerary1)
  end

  it "should have an #users method that returns a collection of users associated to that activity" do
    activity1.locations << location1
    activity1.locations.first.days << day1
    activity1.locations.first.days.first.itineraries << itinerary1
    activity1.locations.first.days.first.itineraries.first.users << user1
    expect(activity1.users.count).to be(1)
    expect(activity1.users).to include(user1)
  end

end
