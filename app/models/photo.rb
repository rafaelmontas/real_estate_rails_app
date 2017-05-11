class Photo < ApplicationRecord
  belongs_to :property
  include ImageUploader[:image]
end
