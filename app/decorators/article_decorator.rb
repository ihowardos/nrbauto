class ArticleDecorator < ApplicationDecorator
  delegate :title, :text, :date, :image
end
