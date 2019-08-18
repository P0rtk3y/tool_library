class Library < ApplicationRecord
  has_secure_password
  has_many :tools 

  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true
end
