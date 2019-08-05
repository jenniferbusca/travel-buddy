class CreateItineraryActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :itinerary_activities do |t|
      t.datetime :start_date
      t.datetime :start_time
      t.string :duration
      t.integer :location_id
      t.integer :activity_id
      t.integer :itinerary_id

      t.timestamps
    end
  end
end
