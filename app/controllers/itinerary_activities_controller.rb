class ItineraryActivitiesController < ApplicationController
  before_action :set_itinerary_activity, only: [:show, :edit, :update, :destroy]

  def new
    @itinerary_activity = ItineraryActivity.new
  end

  def create #sign up new itinerarys
    @itinerary_activity = ItineraryActivity.new(itinerary_activity_params)
    @itinerary_activity.itinerary_id = params[:itinerary_id]
    if @itinerary_activity.save
      redirect_to itinerary_path(params[:itinerary_id])
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @itinerary.update(itinerary_params)
    redirect_to itinerary_path(@itinerary)
  end

  def destroy
    @itinerary.destroy
    redirect_to itineraries_path
  end


  private
  def set_itinerary_activity
    @itinerary_activity = ItineraryActivity.find(params[:id])
  end

  def itinerary_activity_params
    params.require(:itinerary_activity).permit(:start_date, :start_time, :duration, :location_id, :activity_id, :itinerary_id)
  end
end
