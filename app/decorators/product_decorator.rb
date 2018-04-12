class ProductDecorator < ApplicationDecorator
  delegate :id, :title, :description, :category,
    :compatibility_model, :compatibility_oem, :images

  def preview_image
    images[0] ? images[0].url : default_url
  end

  def focus_image
    if images[0] && images[1]
      images[1].url
    elsif images[0] && images[1].nil?
      images[0].url
    else
      default_url
    end
  end

  def truncate_description
    h.truncate(description,
      length: 255,
      separator: ' ',
      omission: "..."
    )
  end

  def truncate_compatibility_model
    h.truncate(compatibility_model,
      length: 255,
      separator: ' ',
      omission: "..."
    )
  end

  def truncate_compatibility_oem
    h.truncate(compatibility_oem,
      length: 255,
      separator: ' ',
      omission: "..."
    )
  end

  private

  def default_url
    ImageUploader.new.default_url
  end
end
