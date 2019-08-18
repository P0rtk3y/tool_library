class SessionsController < ApplicationController
  def new
  end

  def create
    @library = Library.find_by(username: params[:library][:username])
      if @library && @library.authenticate(params[:library][:password])
        session[:user_id] = @library.id
        flash[:message] = "#{@library.username.capitalize}, here is your tool library:"
        redirect_to library_tools_path(@library)
      else
        flash[:message] = "Username or password is incorrect. Please, try again."
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
