class AddImageDataToProperties < ActiveRecord::Migration[5.0]
  def change
    add_column :properties, :image_data, :text
  end
end
