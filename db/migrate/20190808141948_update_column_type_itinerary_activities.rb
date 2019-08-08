class UpdateColumnTypeItineraryActivities < ActiveRecord::Migration[5.2]
  def change
    change_column :itinerary_activities, :end_time, :datetime
  end
end
