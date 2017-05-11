class AddPropertyIdToPhotos < ActiveRecord::Migration[5.0]
  def change
    add_reference :photos, :property, foreign_key: true
  end
end
