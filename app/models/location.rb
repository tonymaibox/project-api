class Location < ApplicationRecord
	validates	:city, presence: true
	has_many :days_locations
	has_many :days, through: :days_locations
	# belongs_to :itinerary, optional: true
	has_many :itineraries, through: :days
	has_many :users_itineraries, through: :itinerary
	has_many :users, through: :users_itineraries

	has_many :locations_activities
	has_many :activities, through: :locations_activities

	def self.search(query)
		where("city ILIKE ?", "%#{query}%")
	end

	def self.search_itineraries(query)
		list = []
		self.search(query).each do |location|
			list << location.itineraries
		end
		list.flatten!
	end

	# def self.search_itineraries(query)
	# 	list = []
	# 	self.search(query).each do |location|
	# 		Itinerary.all.collect do |itinerary|
	# 			itinerary.locations.collect do |itinerary_location|
	# 				if itinerary_location.id == location.id
	# 					list << itinerary
	# 				end
	# 			end
	# 		end
	# 	end
	# 	list
	# end

end
