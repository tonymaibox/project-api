class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :name, :image_url_thumb, :image_url_medium
end
