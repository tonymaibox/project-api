require 'rails_helper'

RSpec.describe GamesController, :type => :controller do
  let(:current_user) { User.create(username: "YOUser", password: "password", email: "you@mail.com", first_name: "You", last_name: "Yes you")}

  before(:each) do
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe "#create" do
  	it "creates an itinerary associated with the current user" do
  		expect do
  			post :create
  		end.to change {Itinerary.count}.from(0).to(1)
  	end
  	it "allows the current user to add days"
  	it "allows the current user to add locations"
  	it "allows the current suer to add activities"
  end

  describe "#index"
  	it "shows all itinearies in the database"

  describe "#show"
  	it "shows an individual itinerary"

  describe "#update"
  	it "allows the current user to edit his/her itinerary"




end
