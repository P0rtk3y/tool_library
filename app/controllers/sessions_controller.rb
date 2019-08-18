class SessionsController < ApplicationController
  def new
  end

  def create
    @library = Library.find_by(username: params[:library][:username])
      if @library && @library.authenticate(params[:library][:password])
        session[:library_id] = @library.id
        flash[:message] = "Welcome, #{@library.username}!"
        redirect_to library_tools_path(@library)
      else
        flash[:message] = "Sorry! Wrong credentials."
        render :new
      end
    end
  end

  def home
  end

  def destroy
    session.delete :library_id
    flash[:message] = "See you next time!"
    redirect_to root_path
  end
end
