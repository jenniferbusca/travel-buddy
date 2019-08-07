class Itinerary < ApplicationRecord
  belongs_to :user
  has_many :itinerary_activities
  has_many :activities, through: :itinerary_activities

  def future_itinerary?
    self.start_date > Date.today ? true : false
  end

  def in_progress?
    calculated_end_date = self.start_date + self.trip_length
    start_date = self.start_date
    end_date = self.end_date
    today =  Date.today
    start_date < today && end_date > today && end_date <= calculated_end_date ? true : false
  end

  def trip_length
    end_date - start_date
  end
end
