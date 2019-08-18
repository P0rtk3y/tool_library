class LibrariesController < ApplicationController

  #loads signup form
  def new
    @library = Library.new
  end

  #signup
  def create
    @library = Library.new (library_params)
    if @library.save
      session[:library_id] = @library.id
    else
      render :new
    end
  end

  private

  def library_params
    params.require(:library).permit(:username, :email, :password)
  end
end
