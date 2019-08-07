class ItinerariesController < ApplicationController
  def new
    @itinerary = Itinerary.new
  end

  def create #sign up new users
    @itinerary = Itinerary.new(itinerary_params)
    @itinerary.user_id = current_user.id
    if @itinerary.save
      redirect_to itinerary_path(@itinerary)
    else
      render 'new'
    end
  end

  def show
  end

  private
  def itinerary_params
    params.require(:itinerary).permit(:name, :start_date, :end_date, :user_id)
  end
end
