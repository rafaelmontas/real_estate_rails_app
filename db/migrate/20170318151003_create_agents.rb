class CreateAgents < ActiveRecord::Migration[5.0]
  def change
    create_table :agents do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :alt_phone_number
      t.timestamps
    end
  end
end
