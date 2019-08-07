class ItineraryActivities < ApplicationRecord
  belongs_to :itinerary
  belongs_to :activity
  has_many :users, through: :itineraries
end
