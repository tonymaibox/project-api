class Activity < ApplicationRecord
	validates :name, presence: true

	has_many :locations_activities
	has_many :locations, through: :locations_activities
	has_many :days_locations, through: :locations
	has_many :days, through: :days_locations

	# belongs_to :itinerary, optional: true
	has_many :itineraries, through: :days
	has_many :users_itineraries, through: :itinerary
	has_many :users, through: :users_itineraries

	def self.search(query)
		where("name ILIKE ?", "%#{query}%")
	end

# Activity.creator([location.id, params_array[:activities]])
	def self.creator(params_array)
		activities = params_array[1].collect do |activity|
			Activity.create(name: activity[:name], location_ids: params_array[0])
	end
	
end

end
