class Location < ApplicationRecord
	has_many :days_locations
	has_many :days, through: :days_locations
	# should it be belongs_to :itinerary
	has_one :itinerary
	has_many :users_itineraries, through: :itinerary
	has_many :users, through: :users_itineraries

	has_many :locations_activities
	has_many :activities, through: :locations_activities
end
