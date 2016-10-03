class LocationsActivity < ApplicationRecord
  belongs_to :activity, optional: true
  belongs_to :location, optional: true
end
