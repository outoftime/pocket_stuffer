class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  protected

  def current_user=(user)
    @current_user = user
    session[:current_user_id] = user.id
  end

  def current_user
    return @current_user if defined? @current_user
    @current_user = User.find_by_id(session[:current_user_id])
  end

  private

  def ensure_user
    redirect_to root_path unless current_user
  end
end
