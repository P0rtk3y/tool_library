class LoansController < ApplicationController
  before_action :redirect_if_not_logged_in

  def show
    @loan = Loan.find(params[:id])
  end

  def index
    #return only loans nested under borrowers
    @loans = Loan.all
  end

  def new
    if borrower_exists?
      @loan = @borrower.loans.build
    else
      @loan = Loan.new
      @loan.build_borrower #belongs_to
    end
  end

  def create
    if borrower_exists?
      @loan = @borrower.loans.build(loan_params)
    else
      @loan = Loan.new(loan_params)
    end

    if @loan.save
      redirect_to loan_path(@loan)
    end
  end

  def edit
    @loan = Loan.find(params[:id])
  end

  def destroy
    @loan = Loan.find(params[:id])
    @loan.destroy
    redirect_to loans_path
  end

  private

  def borrower_exists?
    params[:borrower_id] && @borrower = Borrower.find_by(id: params[:borrower_id])
  end

  def loan_params
    params.require(:loan).permit(:loaned_on, :duration, :tool_id, :borrower_id, borrower_attributes:[:name])
  end

end
