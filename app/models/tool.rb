class Tool < ApplicationRecord
  belongs_to :library
  has_many :loans
  has_many :borrowers, through: :loans
end
