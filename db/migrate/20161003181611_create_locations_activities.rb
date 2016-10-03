class CreateLocationsActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :locations_activities do |t|
      t.belongs_to :location, foreign_key: true
      t.belongs_to :activity, foreign_key: true

      t.timestamps
    end
  end
end
