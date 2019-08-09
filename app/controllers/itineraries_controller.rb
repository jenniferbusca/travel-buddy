class ItinerariesController < ApplicationController
  before_action :set_itinerary, only: [:show, :edit, :update, :destroy]

  def index
    @in_progress_itineraries = current_user.itineraries.select {| itinerary | itinerary.in_progress?}
    @future_itineraries = current_user.itineraries.select {| itinerary | itinerary.future_itinerary?}
  end

  def new
    @itinerary = Itinerary.new
  end

  def create #sign up new itinerarys
    @itinerary = Itinerary.new(itinerary_params)
    @itinerary.user_id = current_user.id
    if @itinerary.save
      redirect_to itinerary_path(@itinerary)
    else
      render 'new'
    end
  end

  def show
    @itinerary_activities = ItineraryActivity.where(:itinerary_id => @itinerary.id).order(:start_date, :start_time)
  end

  def edit
  end

  def update
    if @itinerary.update(itinerary_params)
      redirect_to itinerary_path(@itinerary)
    else
      render :edit
    end
  end

  def destroy
    @itinerary.destroy
    redirect_to itineraries_path
  end

  private
  def set_itinerary
    @itinerary = Itinerary.find(params[:id])
  end

  def itinerary_params
    params.require(:itinerary).permit(:name, :start_date, :end_date, :itinerary_id)
  end
end
