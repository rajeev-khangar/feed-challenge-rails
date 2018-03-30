class SharesController < ApplicationController
  before_action :set_share, only: [:show, :edit, :update, :destroy]
  

  def index
    @shares = Share.all
    render json: @shares
  end

  def new
    @share = Share.new
  end

  def create
    @share = Share.new(share_params)
    if @share.save
      flash[:success] = "created successfully."
    else
      flash[:alert] = "Please fill required field."
      render 'new'
    end
    render json: @share
  end

  def show
    render json: @share
  end

  def edit
    render json: @share
  end

  def update
    if @share.update(share_params)
      flash[:alert] = "Update Successfully." 
    else
      flash[:alert] = @share.errors.full_messages.join(' ,')
      render 'edit'
    end
    render json: @share
  end

  def destroy
    flash[:alert] = "Destroy Successfully." if @share.destroy
    render json: @share
  end

  private

    def set_share
      @share = Share.find(params[:id])
    end

    def share_params
      params.require(:share).permit(:url, :user_id, activity_attributes: [:id, :verb, :actor, :object])
    end
end