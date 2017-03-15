class Property < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :name, presence: true
  validates :address, presence: true
  validates :price, presence: true, allow_nil: false
end
