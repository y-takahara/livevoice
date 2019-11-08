class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def set_search
    @search = Review.ransack(params[:q])
    @results = @search.result
  end


  def after_sign_out_path_for(resource)
    new_user_session_path
   end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :avatar])
  end

end
