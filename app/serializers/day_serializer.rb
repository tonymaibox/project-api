class DaySerializer < ActiveModel::Serializer
  attributes :id, :day
  has_many :locations

end
