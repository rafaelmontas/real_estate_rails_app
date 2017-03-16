class AddTagsToProperties < ActiveRecord::Migration[5.0]
  def change
    add_column :properties, :balcon, :boolean
    add_column :properties, :piscina, :boolean
    add_column :properties, :cisterna, :boolean
    add_column :properties, :planta_electrica, :boolean
    add_column :properties, :jacuzzi, :boolean
    add_column :properties, :gym, :boolean
    add_column :properties, :habitacion_servicio, :boolean
    add_column :properties, :ascensor, :boolean
    add_column :properties, :seguridad, :boolean
    add_column :properties, :gas, :boolean
  end
end
