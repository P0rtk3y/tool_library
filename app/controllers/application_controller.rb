class ApplicationController < ActionController::Base
  before_action :redirect_if_not_logged_in
  helper_method :current_user, :logged_in?, :tool_available?

  def current_user
    @library = Library.find_by(id: session[:library_id])
  end

  def logged_in?
    current_user
  end

  def redirect_if_not_logged_in
    unless logged_in?
      flash[:message] = "Please log in!"
      redirect_to login_path if !logged_in?
    end
  end

  def tool_available?
    if @tool ||= Tool.find_by(id: params[:id])
      if @tool.in_library
      end
    end
  end


end
