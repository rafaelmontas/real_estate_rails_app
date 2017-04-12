class AddResetToAgents < ActiveRecord::Migration[5.0]
  def change
    add_column :agents, :reset_digest, :string
    add_column :agents, :reset_sent_at, :datetime
  end
end
