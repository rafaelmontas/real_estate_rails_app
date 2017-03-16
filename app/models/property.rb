class Property < ApplicationRecord
  include ImageUploader[:image]

  validates :name, presence: true
  validates :address, presence: true
  validates :price, presence: true, allow_nil: false
end
