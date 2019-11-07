class UsersController < ApplicationController
  def show 
    user = User.find(params[:id])
    @nickname = user.nickname
    @reviews = user.reviews.order("id DESC").page(params[:page]).per(6)
  end
end
