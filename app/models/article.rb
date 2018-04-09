class Article < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :title, :text, :date, presence: true
end
