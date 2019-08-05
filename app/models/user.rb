class User < ApplicationRecord
  has_many :itineraries
  has_many :itinerary_activities, through: :itinerary
  has_secure_password
  before_save {self.email = email.downcase}

  validates :username, presence: true,
    uniqueness: {case_sensitive: false},
    length: {minimum: 6, maximum: 25}

  validates :email_address, presence: true,
    uniqueness: {case_sensitive: false},
    length: {minimum: 6, maximum: 40},
    format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
end
