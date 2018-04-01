class Product < ApplicationRecord
  mount_uploaders :images, ImageUploader

  after_create :default_category

  validates :title, :description, presence: true

  enum category: {
    fuel_cap: "Крышка топливного бака с замком",
    radiator_cap: "Крышка радиатора",
    adblue: "Крышка ADBLUE",
    oil_cap: "Масляная крышка",
    radiator_neck: "Горловина радиатора",
    fuel_neck: "Горловина топливного бака",
    spreader_part: "Детали брызговика",
    other: "Другое"
  }

  private

  def default_category
    self.category = "other" unless category
  end
end
