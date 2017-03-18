class AddPasswordDigestToAgents < ActiveRecord::Migration[5.0]
  def change
    add_column :agents, :password_digest, :string
  end
end
