class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.integer :number
      t.string :name
      t.integer :postcode

      t.timestamps
    end
  end
end
