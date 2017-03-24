class AddRememberDigestToAgents < ActiveRecord::Migration[5.0]
  def change
    add_column :agents, :remember_digest, :string
  end
end
