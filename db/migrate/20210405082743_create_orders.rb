class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :count
      t.references :client, null: false, foreign_keys: true

      t.timestamps
    end
  end
end
