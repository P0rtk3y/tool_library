class LoansController < ApplicationController
  before_action :redirect_if_not_logged_in

  def show
    @loan = Loan.find(params[:id])
  end

  def index
    #return only loans nested under borrowers
    if params[:borrower_id] && borrower = Borrower.find_by_id(params[:borrower_id])
      @loans = borrower.loans.order('loaned_on DESC')
    else
      @loans = Loan.all.order('loaned_on DESC')
    end

  end

  def new
    if params[:borrower_id] && @borrower = Borrower.find_by_id(params[:borrower_id])
      @loan = @borrower.loans.build #has_many
    else
      @loan = Loan.new
      @loan.build_borrower #belongs_to
    end
  end

  def create
    if params[:borrower_id] && @borrower = Borrower.find_by_id(params[:borrower_id])
      @loan = @borrower.loans.build(loan_params)
    else
      @loan = Loan.new(loan_params)
    end

    if @loan.save
      redirect_to loans_path
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

  def is_nested?
    if params[:borrower_id] && @borrower = Borrower.find_by_id(params[:borrower_id])
    end
  end

  def loan_params
    params.require(:loan).permit(:loaned_on, :duration, :tool_id, :borrower_id, borrower_attributes:[:name])
  end

end
