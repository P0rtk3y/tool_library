class Loan < ApplicationRecord
  belongs_to :tool
  belongs_to :borrower
end
