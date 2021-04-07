class Client < ApplicationRecord
  has_many :orders, dependent: :destroy

  validates :name, presence: true
  validates :number, presence: true #, uniqueness: true
end
