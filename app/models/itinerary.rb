class Itinerary < ApplicationRecord
  validates	:name, presence: true
  validates :name, uniqueness: true

  has_many :users_itineraries
  has_many :users, through: :users_itineraries
	has_many :days
	has_many :days_locations, through: :days
	has_many :locations, through: :days_locations
	has_many :locations_activities, through: :locations
	has_many :activities, through: :locations_activities
end
