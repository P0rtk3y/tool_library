class LoansController < ApplicationController
  skip_before_action :redirect_if_not_logged_in

  def index

  end

  def show

  end

  def new
    @loan = Loan.new
    @loan.build_borrower #belongs_to
  end

  def create
    @loan = Loan.new(loan_params)
    if @loan.save
      redirect_to loan_path(@loan)
    else
      render :new
    end
  end

  private

  def loan_params
    params.require(:loan).permit(:loaned_on, :duration, :tool_id, :borrower_id, borrower_attributes:[:name])
  end

end
