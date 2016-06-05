# frozen_string_literal: true
class PostHeaderUploader < ApplicationUploader
  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  def scale(_width, _height)
    process resize_to_fit: [1400, 1100]
  end
end
