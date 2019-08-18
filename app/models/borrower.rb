class Borrower < ApplicationRecord
  has_many :loans
  has_many :tools, through :loans

end
