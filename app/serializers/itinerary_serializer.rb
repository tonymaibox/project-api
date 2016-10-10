class ItinerarySerializer < ActiveModel::Serializer
  attributes :id, :name, :upvotes
  has_many :users
  has_many :days

end
