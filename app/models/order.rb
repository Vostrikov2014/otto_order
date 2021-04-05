class Order < ApplicationRecord
  has_one :client
  has_and_belongs_to_many  :products

  accepts_nested_attributes_for :client, reject_if: :all_blank

  #validates :client_id, presence: true

end
