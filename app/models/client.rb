class Client < ApplicationRecord
  has_many :orders, dependent: :destroy

  validates :number, :name, presence: true
end
