class User < ApplicationRecord
  has_many :itineraries
  has_many :itinerary_activities, through: :itinerary
  has_secure_password

  validates :name, presence: true,
    length: {minimum: 6, maximum: 12}
    
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
    uniqueness: {case_sensitive: false},
    length: {minimum: 6, maximum: 25},
    format: {with: VALID_EMAIL_REGEX}
end
