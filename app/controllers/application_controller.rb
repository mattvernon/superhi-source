class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # use @current_user both in views and controllers
  helper_method :current_user, :is_logged_in?

  # run this on every single page and action
  before_action :current_user

  def current_user
    if is_logged_in?
      @current_user = User.find(session[:user_id])
    else
      @current_user = nil
    end

    @current_user
  end

  def is_logged_in?
    session[:user_id].present?
  end


  def force_login
    unless is_logged_in?
      flash[:error] = "You must sign up to view this page"
      redirect_to new_user_path
    end
  end

end
