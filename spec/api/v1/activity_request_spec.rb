require 'rails_helper'
describe "wanderlyst Activity API" do
	# describe "get /activities" do
	# 	it 'returns a JSON collection of all the activites' do
  #     Activity.create(name: "Eating")
  #     Activity.create(name: "Shopping")
	#     get '/api/v1/activities'
	#     response_body = JSON.parse(response.body)
	#     expect(response).to be_success
	#     expect((response_body).length).to eq(2)
	# 	end
	# end
  # describe "get /activities/1" do
	# 	it 'returns a JSON collection of one activity' do
	# 		activity1 = Activity.create(name: "Eating")
	#     get '/api/v1/activities/1'
	#     response_body = JSON.parse(response.body)
	#     expect(response).to be_success
	#     expect(response_body["first_name"]).to eq(activity1.first_name)
	# 	end
	# end

  # describe "post /activities" do
	# 	context "when valid" do
	# 		it 'create a activity' do
	# 	    post '/api/v1/activities', {activity: {name: "Rock Climbing"}}
	# 	    response_body = JSON.parse(response.body)
	# 	    expect(response).to be_success
	# 	    activity1 = Activity.first
	# 	    expect(Activity.count).to eq(1)
	# 	    expect(activity1.name).to eq("Rock Climbing")
	# 	    expect(response_body["name"]).to eq("Rock Climbing")
	# 		end
	# 	end
	# 	context "when invalid" do
	# 		it 'returns an error and message' do
	# 	    post '/api/v1/activities', {activity: {}}
	# 	    response_body = JSON.parse(response.body)
	# 	    expect(response.status).to eq(500)
	# 	    expect(response_body).to eq({"name" => ["can't be blank"]})
	# 		end
	# 	end
	# end
  #
  # describe "patch /activities/:id" do
	# 	context "when valid" do
	# 		it 'updates a activity' do
	# 			Activity.create(name: "Eating")
	# 	    patch '/api/v1/activities/1', {activity: {name: "Dining"}}
	# 	    activity1 = Activity.first
	# 	    expect(response).to be_success
	# 	    expect(Activity.count).to eq(1)
	# 	    expect(activity1.name).to eq("Dining")
	# 		end
	# 	end
	# 	context "when invalid" do
	# 		it 'returns an error and message' do
	# 			Activity.create(name: "Eating")
	# 	    patch '/api/v1/activities/1', {activity: {name: ""}}
	# 	    response_body = JSON.parse(response.body)
	# 	    expect(response.status).to eq(500)
	# 	    expect(response_body).to eq({"name" => ["can't be blank"]})
	# 		end
	# 	end
	# end
  #
	# describe "destroy /activities/:id" do
	# 	context "when valid" do
	# 		it 'deletes an activity' do
	# 			Activity.create(name: "Eating")
	# 	    delete '/api/v1/activities/1'
	# 	    expect(response).to be_success
	# 	    expect(Activity.count).to eq(0)
	# 	 	end
	# 	end
	# 	context "does not exist" do
	# 		it 'returns an error and message' do
	# 	    delete '/api/v1/activities/1'
	# 	    expect(response.status).to eq(404)
	# 	    expect(JSON.parse(response.body)).to eq({"error" => "activity with id of 1 not found"})
	# 		end
	# 	end
	# end

end
