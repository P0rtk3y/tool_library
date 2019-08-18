class Loan < ApplicationRecord
  belongs_to :tool
  belongs_to :borrower

  # accepts_nested_attributes_for :borrower #doesn't prevent duplicates

  def borrower_attributes=(borrower_params)
    byebug
  end
end
