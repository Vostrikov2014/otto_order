class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :quantity
      t.references :client, foreign_keys: true

      t.timestamps
    end
  end
end
