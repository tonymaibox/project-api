class LocationSerializer < ActiveModel::Serializer
  attributes :id, :city
  has_many :activities
end
