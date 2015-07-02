class Restaurant < ActiveRecord::Base
  # belongs_to :owner, class_name: "User"

  has_many :tables
  has_many :reservations, through: :tables

  belongs_to :category
end
