class Activity < ApplicationRecord
	has_many :locations_activities
	has_many :locations, through: :locations_activities
	has_many :days_locations, through: :locations
	has_many :days, through: :days_locations

	# belongs_to :itinerary
	has_one :itinerary
	has_many :users_itineraries, through: :itinerary
	has_many :users, through: :users_itineraries
end
