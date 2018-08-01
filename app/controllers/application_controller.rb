class ApplicationController < ActionController::Base
before_action :authorized
helper_method :logged_in?, :current_user

  def current_user
    @user = User.find_by(id: session[:logged_in_user])
  end

  def logged_in?
    !!current_user
  end

  def authorized
    unless flash[:notice] = "Youse must be logged in to this page"
      redirect_to "/login"
    end
  end


end
