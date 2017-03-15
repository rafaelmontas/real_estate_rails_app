class Property < ApplicationRecord
  has_attached_file :image, styles: { large: "920x420" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :name, presence: true
  validates :address, presence: true
  validates :price, presence: true, allow_nil: false
end
