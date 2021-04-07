class Order < ApplicationRecord
  belongs_to :client
  has_many :orders_products
  has_many :products, through: :orders_products

  accepts_nested_attributes_for :client, reject_if: :all_blank
  accepts_nested_attributes_for :orders_products, reject_if: :all_blank

  validates :count, presence: true, uniqueness: true
end
