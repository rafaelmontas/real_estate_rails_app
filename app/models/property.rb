class Property < ApplicationRecord
  belongs_to :agent
  has_many :photos, dependent: :destroy
  has_many :likes
  has_many :users, through: :likes


  validates :name, presence: { message: "Nombre no puede estar en blanco" }
  validates :address, presence: { message: "Calle/Ubicación no puede estar en blanco" }
  validates :price, presence: { message: "Precio no puede estar en blanco" }, allow_nil: false
  validates :sale, presence: true
  validates :kind, presence: true
  validates :room, presence: true, allow_nil: false
  validates :bath, presence: true, allow_nil: false
  validates :parking, presence: true, allow_nil: false
  validates :location, presence: true
  validates :mts, presence: { message: "Metros Cuadrados no puede estar en blanco" }, allow_nil: false
  validates :general, presence: { message: "Descripción no puede estar en blanco" }
end
