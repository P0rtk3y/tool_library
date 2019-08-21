class Library < ApplicationRecord
  has_secure_password
  has_many :new_borrowers, foreign_key: "library_id", class_name: "Borrower"
  has_many :tools
  has_many :old_borrowers, through: :tools, source: :borrowers


  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true

  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_initialize do |library|
      library.username = auth.info.name
      library.email = auth.info.email
      library.password = SecureRandom.hex
    end
  end
end
