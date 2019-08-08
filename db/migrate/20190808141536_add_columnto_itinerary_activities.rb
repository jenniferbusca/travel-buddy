class AddColumntoItineraryActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :itinerary_activities, :end_date, :datetime
    rename_column :itinerary_activities, :duration, :end_time
  end
end
