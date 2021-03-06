class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]

  def index
    @activities = Activity.all.order(:name)
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(name: activity_params[:name])
    @activity.activity_category_id = activity_params[:activity_category]
    if @activity.save
      redirect_to new_itinerary_itinerary_activity_path(session[:itinerary_id])
    else
      render 'new'
    end
  end

  def show
    @activity_category = ActivityCategory.find(@activity.activity_category_id)
  end

  def edit
  end

  def update
    if @activity.update(activity_params)
      redirect_to activity_path(@activity)
    else
      render :edit
    end
  end

  def destroy
    @activity.destroy
    redirect_to itineraries_path(current_user)
  end

  private
  def set_activity
    @activity = Activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:name, :activity_category, :itinerary_id)
  end
end
