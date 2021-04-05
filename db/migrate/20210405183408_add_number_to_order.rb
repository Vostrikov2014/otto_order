class AddNumberToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :number, :integer
  end
end
