class ItineraryActivitiesController < ApplicationController
  before_action :set_itinerary_activity, only: [:show, :edit, :update, :destroy]

  def new
    @itinerary_activity = ItineraryActivity.new
    @itinerary_id = params[:itinerary_id]
    @itinerary = Itinerary.find(params[:itinerary_id])
  end

  def create
    @itinerary_activity = ItineraryActivity.new(itinerary_activity_params)
    if @itinerary_activity.save
      redirect_to itinerary_path(itinerary_activity_params[:itinerary_id])
    else
      redirect_to new_itinerary_itinerary_activity_path(itinerary_activity_params[:itinerary_id])
    end
  end

  def edit
  end

  def update
    @itinerary_activity.update(itinerary_activity_params)
    redirect_to itinerary_path(@itinerary)
  end

  def destroy
    @itinerary_activity.destroy
    redirect_to itinerary_activities_path
  end


  private
  def set_itinerary_activity
    @itinerary_activity = ItineraryActivity.find(params[:id])
  end

  def itinerary_activity_params
    params.require(:itinerary_activity).permit(:start_date, :start_time, :end_date, :end_time, :location_name, :itinerary_id, :activity_name, activity_attributes: [:name, :category])
  end
end
