class ApplicationController < ActionController::Base
  def current_user
    @library = Library.find_by_id(session[:library_id])
  end

  def logged_in?
    !!session[:library_id]
  end

  def require_login
    unless logged_in?
      flash[:message] = "Please log in"
      reidrect_to root_path
    end
  end

end
