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
  def set_itinerary
    @itinerary = Itinerary.find(params[:id])
  end

  def itinerary_params
    params.require(:itinerary).permit(:name, :start_date, :end_date, :itinerary_id)
  end
end
