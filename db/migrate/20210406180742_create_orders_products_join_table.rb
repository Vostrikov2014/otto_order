class CreateOrdersProductsJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :orders, :products do |t|
      t.index [:order_id, :product_id], unique: true
    end
  end
end
