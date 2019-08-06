class User < ApplicationRecord
  has_many :itineraries
  has_many :itinerary_activities, through: :itinerary
  has_secure_password
  before_save {self.email = email.downcase}

  validates :email, presence: true,
    uniqueness: {case_sensitive: false},
    length: {minimum: 6, maximum: 40},
    format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}

  validates :password, presence: true, length: { minimum: 6, maximum: 25 }

  def self.from_omniauth(auth)
    # Creates a new user only if it doesn't exist
    where(email: auth.info.email).first_or_initialize do |user|
      user.name = auth.info.name
      user.email = auth.info.email
    end
  end

end
