class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  

  def index
    @posts = Post.all
    render json: @posts
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "created successfully."
    else
      flash[:alert] = "Please fill required field."
      render 'new'
    end
    render json: @post
  end

  def show
    render json: @post
  end

  def edit
    render json: @post
  end

  def update
    if @post.update(post_params)
      flash[:alert] = "Update Successfully." 
    else
      flash[:alert] = @post.errors.full_messages.join(' ,')
      render 'edit'
    end
    render json: @post
  end

  def destroy
    flash[:alert] = "Destroy Successfully." if @post.destroy
    render json: @post
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:content, :user_id, activity_attributes: [:id, :verb, :actor, :object])
    end
end