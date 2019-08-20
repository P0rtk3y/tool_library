class Loan < ApplicationRecord
  belongs_to :tool
  belongs_to :borrower

  # accepts_nested_attributes_for :borrower #doesn't prevent duplicates
  validates :duration, presence: true
  validates_associated :borrower

  def borrower_attributes=(borrower_params)
    borrower = Borrower.find_or_create_by(borrower_params)
    if borrower.valid?
      self.borrower = borrower
    end
  end


end
