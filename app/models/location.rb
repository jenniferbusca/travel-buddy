class Location < ApplicationRecord
  has_many :itinerary_activities
  has_many :activities, through: :itinerary_activities
  has_many :itineraries, through: :itinerary_activities
end
