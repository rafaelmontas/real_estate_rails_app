class AddAdminToAgents < ActiveRecord::Migration[5.0]
  def change
    add_column :agents, :admin, :boolean, default: false
  end
end
