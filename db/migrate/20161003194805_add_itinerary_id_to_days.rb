class AddItineraryIdToDays < ActiveRecord::Migration[5.0]
  def change
    add_reference :days, :itinerary, foreign_key: true
  end
end
