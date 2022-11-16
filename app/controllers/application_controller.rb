class ApplicationController < ActionController::Base
  helper_method :logged_in?

  def home
  end

  def logged_in?
    @current_user = User.find_by(id: session[:user_id])
  end
end
