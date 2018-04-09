class ArticleDecorator < ApplicationDecorator
  delegate :title, :text, :image, :date

  def date_str
    object.date&.strftime("%d/%m/%Y в %H:%M")
  end
end
