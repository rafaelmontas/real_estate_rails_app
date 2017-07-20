class Property < ApplicationRecord

  include ImageUploader[:image1]
  include ImageUploader[:image2]
  include ImageUploader[:image3]
  include ImageUploader[:image4]
  include ImageUploader[:image5]
  include ImageUploader[:image6]
  include ImageUploader[:image7]
  include ImageUploader[:image8]

  belongs_to :agent
  has_many :photos, dependent: :destroy
  has_many :likes
  has_many :users, through: :likes


  validates :name, presence: { message: "no puede estar en blanco" }
  validates :address, presence: { message: "no puede estar en blanco" }
  validates :price, presence: { message: "no puede estar en blanco" }, allow_nil: false
  validates :sale, presence: true
  validates :kind, presence: true
  validates :room, presence: true, allow_nil: false
  validates :bath, presence: true, allow_nil: false
  validates :parking, presence: true, allow_nil: false
  validates :location, presence: true
  validates :mts, presence: { message: "no puede estar en blanco" }, allow_nil: false
  validates :general, presence: { message: "no puede estar en blanco" }
end
