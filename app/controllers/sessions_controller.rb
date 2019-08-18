class SessionsController < ApplicationController
  skip_before_action :redirect_if_not_logged_in

  def new
  end

  def create
    @library = Library.find_by(username: params[:library][:username])
    if @library && @library.authenticate(params[:library][:password])
      session[:library_id] = @library.id
      redirect_to library_path(@library)
    else
      flash[:message] = "Sorry! Wrong credentials."
      redirect_to login_path
    end
  end

  def home
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
