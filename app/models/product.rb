class Product < ApplicationRecord
  has_many :orders_products
  has_many :orders, through: :orders_products

  validates :title, presence: true
end
