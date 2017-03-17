class Property < ApplicationRecord
  include ImageUploader[:image]

  validates :name, presence: true
  validates :address, presence: true
  validates :price, presence: true, allow_nil: false
  validates :sale, presence: true
  validates :kind, presence: true
  validates :room, presence: true, allow_nil: false
  validates :bath, presence: true, allow_nil: false
  validates :parking, presence: true, allow_nil: false
  validates :location, presence: true
  validates :mts, presence: true, allow_nil: false
  validates :general, presence: true
end
