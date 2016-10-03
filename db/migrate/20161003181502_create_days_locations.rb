class CreateDaysLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :days_locations do |t|
      t.belongs_to :day, foreign_key: true
      t.belongs_to :location, foreign_key: true

      t.timestamps
    end
  end
end
