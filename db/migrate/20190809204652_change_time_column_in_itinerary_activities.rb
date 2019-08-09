class ChangeTimeColumnInItineraryActivities < ActiveRecord::Migration[5.2]
  def change
    change_column :itinerary_activities, :start_time, :time
    change_column :itinerary_activities, :end_time, :time
  end
end
