class ReviewsController < ApplicationController

  before_action :move_to_home ,except: [:home]

  def home
  end

  def index
    @reviews = Review.all.order("created_at DESC").page(params[:page]).per(6)
  end

  def new
    @review = Review.new
  end

  def show
    @review = Review.find(params[:id])
    @comments = @review.comments.includes(:user)
  end

  def edit
    @review = Review.find_by(id: params[:id])
  end

  def update
    @review = Review.find_by(id: params[:id])
    if @review.user_id == current_user.id
    @review.update(review_params)
    end
    render :show
  end

  def create
    @review = Review.create(review_params)
    if @review.valid?
      render :home
    else
      render :new
    end
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

  def move_to_home
    redirect_to action: :home unless user_signed_in?
  end

end
