class Table < ActiveRecord::Base
  belongs_to :restaurant

  has_many :reservations
  has_many :users, through: :reservations
end
