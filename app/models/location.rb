class Location < ApplicationRecord
  has_many :itinerary_activities
  has_many :activities, through: :itinerary_activities
  has_many :itineraries, through: :itinerary_activities

  def full_name
    self.city + ", " + self.country
  end

  # def cities
  #   @cities = CS.get(params[:country], params[:state])
  # end

  # def cities_countries
  #   CS.states(country).keys.flat_map { |state| CS.cities(state, country) }
  # end

end
