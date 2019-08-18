class ToolsController < ApplicationController
  before_action :require_login

  def index
    @library = Library.find_by(id: params[:library_id])
  end

  def new
    @library = Library.find_by(id: params[:library_id])
    @tool = Tool.new
  end


  private

  def tool_params
    params.require(:tool).permit(:name, :description, :library_id, :in_library, :borrowed_on)
  end
end
