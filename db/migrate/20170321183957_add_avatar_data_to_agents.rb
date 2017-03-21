class AddAvatarDataToAgents < ActiveRecord::Migration[5.0]
  def change
    add_column :agents, :avatar_data, :text
  end
end
