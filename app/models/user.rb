class User < ApplicationRecord
  has_many :itineraries
  has_many :itinerary_activities, through: :itinerary
  has_secure_password
end
