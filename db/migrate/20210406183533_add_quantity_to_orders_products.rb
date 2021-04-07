class AddQuantityToOrdersProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :orders_products, :quantity, :integer, default: 0
  end
end
