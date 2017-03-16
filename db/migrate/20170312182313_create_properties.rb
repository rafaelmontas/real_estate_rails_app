class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.string :name
      t.string :address
      t.integer :price
      t.string :sale
      t.string :kind
      t.integer :room
      t.integer :bath #Change to integer
      t.integer :parking
      t.integer :mts
      t.string :location
      t.text :general
      t.timestamps
    end
  end
end
