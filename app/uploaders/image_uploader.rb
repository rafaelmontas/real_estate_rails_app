require "image_processing/mini_magick"

class ImageUploader < Shrine
  # plugins and uploading logic
  include ImageProcessing::MiniMagick
  plugin :processing
  plugin :versions   # enable Shrine to handle a hash of files
  plugin :delete_raw # delete processed files after uploading

  process(:store) do |io, context|
    original = io.download

    size_800 = resize_to_limit!(original, 800, 420)
    size_250 = resize_to_limit(size_800, 250, 150)
    size_200 = resize_to_limit(original, 200, 200)

    {original: io, large: size_800, medium: size_250, small: size_200}
  end
end
