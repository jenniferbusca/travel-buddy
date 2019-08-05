class ItineraryActivities < ApplicationRecord
  belongs_to :itineraries
  belongs_to :activities
  has_many :users, through: :itineraries
end
