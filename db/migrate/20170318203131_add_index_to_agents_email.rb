class AddIndexToAgentsEmail < ActiveRecord::Migration[5.0]
  def change
    add_index :agents, :email, unique: true
  end
end
