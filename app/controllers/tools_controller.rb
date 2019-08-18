class ToolsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index
    @library = Library.find_by(id: params[:library_id])
  end

  def new
    @library = Library.find_by(id: params[:library_id])
    @tool = Tool.new
  end

  def create
  end 

  def show
  end


  private

  def tool_params
    params.require(:tool).permit(:name, :description, :library_id, :in_library, :borrowed_on)
  end
end
