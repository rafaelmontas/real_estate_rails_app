json.extract! photo, :id, :created_at, :updated_at
json.image_url photo.image_url(:medium)
json.url property_photo_url(@property, photo, format: :json)
