class ToolsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index
    @tools = current_user.tools
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = current_user.tools.build(tool_params)
    if @tool.save
      redirect_to tool_path(@tool)
    else
      render :new
    end
  end

  def show
    find_tool
  end

  def edit
    find_tool
  end

  def update
    find_tool
    if @tool.update(tool_params)
      redirect_to tool_path(@tool)
    else
      render :edit
    end
  end

  def destroy
    find_tool
    @tool.destroy
    flash[:message] = "Tool Deleted!"
    redirect_to tools_path
  end


  private

  def find_tool
    @tool = Tool.find(params[:id])
  end

  def tool_params
    params.require(:tool).permit(:name, :description, :in_library)
  end
end
