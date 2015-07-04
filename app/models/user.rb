class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :email, uniqueness: true

  has_many :reservations
end
