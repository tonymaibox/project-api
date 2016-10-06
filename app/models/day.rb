class Day < ApplicationRecord
	validates :day, presence: true

	belongs_to :itinerary, optional: true
	has_many :users_itineraries, through: :itinerary
	has_many :users, through: :users_itineraries

	has_many :days_locations
	has_many :locations, through: :days_locations
	has_many :locations_activities, through: :locations
	has_many :activities, through: :locations_activities

	def self.search(query)
		Itinerary.all.select do |itinerary|
			itinerary.days.count == query
		end
	end

	def self.search_itineraries(query)
		list = []
		self.search(query).each do |location|
			Itinerary.all.collect do |itinerary|
				itinerary.locations.collect do |itinerary_location|
					if itinerary_location.id == location.id
						list << itinerary
					end
				end
			end
		end
		list
	end

end
