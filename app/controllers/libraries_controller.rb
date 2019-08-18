class LibrariesController < ApplicationController
  skip_before_action :redirect_if_not_logged_in, only: [:new, :create]
  #loads signup form
  def new
    @library = Library.new
  end

  #signup
  def create
    @library = Library.new(library_params)
    if @library.save
      session[:library_id] = @library.id
      redirect_to library_path(@library)
    else
      render :new
    end
  end

  def show
    @library = Library.find_by(id: params[:id])
  end

  private

  def library_params
    params.require(:library).permit(:username, :email, :password)
  end
end
