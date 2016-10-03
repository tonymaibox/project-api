class DaysLocation < ApplicationRecord
  belongs_to :day, optional: true
  belongs_to :location, optional: true
end
