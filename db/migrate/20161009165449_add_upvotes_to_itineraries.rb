class AddUpvotesToItineraries < ActiveRecord::Migration[5.0]
  def change
    add_column :itineraries, :upvotes, :integer, :default => 0
  end
end
