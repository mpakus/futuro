# frozen_string_literal: true

class PhotoUploader < ApplicationUploader
  def scale(_width, _height)
    process resize_to_fill: [1100, 1100]
  end

  version :thumb do
    resize_to_fill(0, 200)
  end
end
