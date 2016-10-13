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

# Day.creator([i.id, params[:itinerary][:days]])
	def self.creator(params_array)
# binding.pry
		days = params_array[1].collect do |day|
			Day.create(day: day[:day], itinerary_id: params_array[0])
		end
		if days.length > 0
			days.each_with_index do |day, index|
				Location.creator([day.id, params_array[1][index][:locations]])
			end
		end
	end

	def self.updater(params_array)
		# [itinerary_id, [collections of days]]
		list_days = Day.where(itinerary_id: params_array[0])
# binding.pry
		days = params_array[1].each_with_index do |day, index|
# binding.pry
			list_days.each do |list_day|
				if list_day.id == day[:id]
					list_day.update(day: index+1, itinerary_id: params_array[0])
				end
			end

			# found_day.update(day: day[:day], itinerary_id: params_array[0])
		end
# binding.pry
		if days.length > 0
			days.each_with_index do |day, index|
# binding.pry
				Location.updater([day[:id], params_array[1][index][:locations]])
			end
		end
	end

end
