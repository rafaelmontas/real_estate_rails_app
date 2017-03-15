class AddImageToProperties < ActiveRecord::Migration[5.0]
  def change
    add_column :properties, :image, :string
  end
end
