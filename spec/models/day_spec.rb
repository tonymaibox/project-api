require 'rails_helper'

describe Day, type: :model do

  let(:day1) { Day.new(day: 1) }
  let(:day2) { Day.new() }
  let(:location1) { Location.new(city: "New York City") }
  let(:activity1) { Activity.new(name: "Shopping") }

  it "is valid with a 'day' attribute" do
    expect(day1).to be_valid
    expect(day1.day).to eq(1)
    day2.valid?
    expect(day2.errors[:day]).to include("can't be blank")
  end

  it "should have an #activities method that returns a collection of activities associated to that day" do
    day1.locations << location1
    day1.locations.first.activities << activity1
    expect(day1.activities.count).to be(1)
    expect(day1.activities).to include(activity1)
  end

end
