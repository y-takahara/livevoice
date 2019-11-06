class UsersController < ApplicationController
  def show 
    user = User.find(params[:id])
    @nickname = user.nickname
    @reviews = user.reviews.page(params[:page]).per(6)
  end
end
