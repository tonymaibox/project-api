class Activity < ApplicationRecord
	#
	# before_save :set_image
	validates :name, presence: true

	has_many :locations_activities
	has_many :locations, through: :locations_activities
	has_many :days_locations, through: :locations
	has_many :days, through: :days_locations

	# belongs_to :itinerary, optional: true
	has_many :itineraries, through: :days
	has_many :users_itineraries, through: :itinerary
	has_many :users, through: :users_itineraries
	has_attached_file :image, styles: { thumb: "300x300", medium: "475x475" } #, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

	def self.search(query)
		where("name ILIKE ?", "%#{query}%")
	end

	def image_url_thumb
    image.url(:thumb)
	end

	def image_url_medium
    image.url(:medium)
	end

	def self.creator(params_array)
		activities = params_array[1].collect do |activity|
			data = Paperclip.io_adapters.for(activity["image"])
			new_activity = Activity.new(name: activity[:name], location_ids: params_array[0])
			new_activity.image = data
			new_activity.save
		end
	end


end
