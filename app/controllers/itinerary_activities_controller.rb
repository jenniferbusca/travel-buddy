class ItineraryActivitiesController < ApplicationController
  before_action :set_itinerary_activity, only: [:show, :edit, :update, :destroy]
  before_action :set_itinerary, only: [:new, :edit]

  def new
    @itinerary_activity = ItineraryActivity.new
  end

  def create
    @itinerary = Itinerary.find(itinerary_activity_params[:itinerary_id])
    @itinerary_activity = ItineraryActivity.new(itinerary_activity_params)
    if @itinerary_activity.save
      redirect_to itinerary_path(itinerary_activity_params[:itinerary_id])
    else
      render action: :new
    end
  end

  def edit

  end

  def update
    @itinerary = Itinerary.find(params[:itinerary_activity][:itinerary_id])
    if @itinerary_activity.update(itinerary_activity_params)
      redirect_to itinerary_path(@itinerary)
    else
      render :edit
    end
  end

  def destroy
    @itinerary_activity.destroy
    redirect_to itinerary_path(@itinerary_activity[:itinerary_id])
  end


  private
  def set_itinerary_activity
    @itinerary_activity = ItineraryActivity.find(params[:id])
  end

  def set_itinerary
    @itinerary = Itinerary.find(params[:itinerary_id])
  end

  def itinerary_activity_params
    params.require(:itinerary_activity).permit(:start_date, :start_time, :end_date, :end_time, :location_name, :itinerary_id, :activity_name)
  end
end
