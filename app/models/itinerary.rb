class Itinerary < ApplicationRecord
  belongs_to :user
  has_many :itinerary_activities
  has_many :activities, through: :itinerary_activities
end
