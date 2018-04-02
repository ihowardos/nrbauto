class ProductDecorator < ApplicationDecorator
  delegate :title, :description, :category,
    :compatibility_model, :compatibility_oem, :images

  def preview_image
    images[0] ? images[0].url : default_url
  end

  def focus_image
    images[1] ? images[1].url : default_url
  end

  private

  def default_url
    ImageUploader.new.default_url
  end
end
