class LikesController < ApplicationController
  before_action :set_review, only: [:create, :destroy]
  def create
    @like = current_user.likes.create(like_params)
    redirect_to reviews_path(@review)
  end

  def destroy
    @like = Like.find_by(like_params, user_id: current_user.id)
    @like.destroy
    redirect_to reviews_path(@review)
  end


  private
  def set_review
    @review = Review.find(params[:review_id])
  end
  def like_params
    params.permit(:review_id)
  end
end
