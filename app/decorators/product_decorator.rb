class ProductDecorator < ApplicationDecorator
  delegate :title, :description, :category,
    :compatibility_model, :compatibility_oem, :images
end
