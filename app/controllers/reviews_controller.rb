class ReviewsController < ApplicationController

  before_action :move_to_index, except: [:home,:index,:show]

  def home
  end

  def index
    @reviews = Review.all.order("id DESC").page(params[:page]).per(6)
  end

  def new
    @review = Review.new
  end

  def show
    @review = Review.find(params[:id])
    @comments = @review.comments.includes(:user)
  end

  def create
    @review = Review.create(review_params)
      render :home
  end

  def destroy
    review = Review.find(params[:id])
    if review.user_id == current_user.id
      review.destroy
    end
  end

  def search
    @search = Review.ransack(params[:q])
    @results = @search.result
  end



  private

  def review_params
    params.require(:review).permit(:event_date,:artist,:venue,:image,:text).merge(user_id: current_user.id)
  end

  def move_to_index 
    redirect_to action: :home unless user_signed_in?
  end

end
