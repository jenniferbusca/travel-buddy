class Activity < ApplicationRecord
  has_many :itinerary_activities
  has_many :itineraries, through: :itinerary_activities
  has_many :locations, through: :itinerary_activities
  validates_presence_of :name, on: :create
  # validates_uniqueness_of :name


end
