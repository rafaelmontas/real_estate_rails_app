class AddImageDataToProperties < ActiveRecord::Migration[5.0]
  def change
    add_column :properties, :image1_data, :text
    add_column :properties, :image2_data, :text
    add_column :properties, :image3_data, :text
    add_column :properties, :image4_data, :text
    add_column :properties, :image5_data, :text
    add_column :properties, :image6_data, :text
    add_column :properties, :image7_data, :text
    add_column :properties, :image8_data, :text
  end
end
