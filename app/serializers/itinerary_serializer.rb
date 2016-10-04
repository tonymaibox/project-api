class ItinerarySerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :users
  has_many :days

end
