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

	def self.updater(params_array)
# binding.pry
		activities = params_array[1].each do |activity|
			loc_act = LocationsActivity.find_or_create_by(location_id: params_array[0])
			a = Activity.find_or_create_by(id: loc_act.activity_id)
			a.update(name: activity[:name], location_ids: params_array[0])
		end
# binding.pry
	end

end
