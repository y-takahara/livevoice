class ReviewsController < ApplicationController

  def home
  end

  def index
    @reviews = Review.find(15)

  end

  def new
    @review = Review.new
  end

  def show
  end

  def create
    @review = Review.new(review_params)
    @review.save
      render :home
  end



  private

  def review_params
    params.require(:review).permit(:event_date,:artist,:venue,:image,:text).merge(user_id: current_user.id)
  end

end
