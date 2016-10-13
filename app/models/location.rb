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

	def self.creator(params_array)
		locations = params_array[1].collect do |location|
			Location.create(city: location[:city], day_ids: params_array[0])
		end
		if locations.length > 0
			locations.each_with_index do |location,index|
				Activity.creator([location.id, params_array[1][index][:activities]])
			end
		end
	end

	def self.updater(params_array)
		locations = params_array[1].each do |location|
			dl = DaysLocation.find_or_create_by(day_id: params_array[0])
			loc = Location.find_or_create_by(id: dl.location_id)
			loc.update(city: location[:city], day_ids: params_array[0])
		end
# binding.pry
		if locations.length > 0
			locations.each_with_index do |location,index|
# binding.pry
				Activity.updater([location[:id], params_array[1][index][:activities]])
			end
		end
	end

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
