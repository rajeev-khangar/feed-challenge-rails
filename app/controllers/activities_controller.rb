class ActivitiesController < ApplicationController
  
  def index
    @activities = Activity.all
    render json: @activities.to_json(:except => [:post_id, :share_id])
  end
end