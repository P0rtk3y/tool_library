class Loan < ApplicationRecord
  belongs_to :tool
  belongs_to :borrower

  # accepts_nested_attributes_for :borrower #doesn't prevent duplicates

  def borrower_attributes=(borrower_params)
    byebug
    borrower = Borrower.find_or_create_by(borrower_params)
    borrower_params[:name].empty? ? self.borrower : self.borrower = borrower
  end


end
