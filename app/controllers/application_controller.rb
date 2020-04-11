class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    # byebug
    @user = (User.find_by(id: session[:user_id]) || User.new)
    # byebug
  end

  def logged_in?
    # byebug
    current_user.id != nil
  end

  def require_logged_in
    # byebug
    return redirect_to(controller: 'sessions', action: 'new') unless logged_in?
  end

end
