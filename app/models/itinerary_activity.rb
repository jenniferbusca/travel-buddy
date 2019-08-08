class ItineraryActivity < ApplicationRecord
  belongs_to :itinerary
  belongs_to :activity
  belongs_to :location
  has_many :users, through: :itineraries

  def activity_name=(name)
    self.activity = Activity.find_or_create_by(name: name)
  end

  def activity_name
     self.activity ? self.activity.name : nil
  end

  def location_name=(name)
    # city_state = name.split(", ")
    # self.location = Location.where(:city => city_state[0], :state => city_state[1]).first_or_create
    self.location = Location.find_or_create_by(name: name)
  end

  def location_name
     self.location ? self.location.name : nil
  end

end
