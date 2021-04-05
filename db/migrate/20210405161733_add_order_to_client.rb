class AddOrderToClient < ActiveRecord::Migration[6.1]
  def change
    add_reference :clients, :order, foreign_keys: true
  end
end
