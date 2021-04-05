class Product < ApplicationRecord
  has_and_belongs_to_many  :orders
  validates :title, presence: true
end
