class BorrowersController < ApplicationController
  def index
    @borrowers = Borrower.order('name ASC')
  end

  def show

  end

  def new
    @borrower = Borrower.new
  end

  def create
    @borrower = current_user.new_borrowers.build(borrower_params)
    if @borrower.save
      redirect_to borrowers_path
    else
      flash[:message] = "Borrower exists!"
      render :new
    end
  end

private


  def borrower_params
    params.require(:borrower).permit(:name)
  end


end
