class Library < ApplicationRecord
  has_secure_password
  has_many :tools
  has_many :borrowers

  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true
end
