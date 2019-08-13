class ItineraryActivity < ApplicationRecord
  belongs_to :itinerary
  belongs_to :activity
  belongs_to :location
  has_many :users, through: :itineraries
  accepts_nested_attributes_for :activity
  validates_presence_of :start_date, :start_time, :end_date, :end_time, :location, on: :create
  validates :dates_invalid, acceptance: { message: '- End date must be later than start date.' }

  def activity_name=(name)
      self.activity = Activity.find_or_create_by(name: name)
  end

  def activity_name
     self.activity ? self.activity.name : nil
  end

  def location_name=(name)
    self.location = Location.find_or_create_by(name: name)
  end

  def location_name
     self.location ? self.location.name : nil
  end

  def dates_invalid
    unless self.start_date.blank? || self.end_date.blank?
      if self.start_date < self.end_date
        true
      elsif
        self.end_date.to_date == self.start_date.to_date && self.start_time < self.end_time
        true
      else
        false
      end
    else
      false
    end
  end

end
