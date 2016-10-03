class Day < ApplicationRecord
	validates :day, presence: true

	belongs_to :itinerary, optional: true
	has_many :users_itineraries, through: :itinerary
	has_many :users, through: :users_itineraries

	has_many :days_locations
	has_many :locations, through: :days_locations
	has_many :locations_activities, through: :locations
	has_many :activities, through: :locations_activities
end
