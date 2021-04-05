class Client < ApplicationRecord
  has_many :orders
  validates :number, :name, presence: true
end
