class UsersItinerary < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :itinerary, optional: true
end
