class ArticleDecorator < ApplicationDecorator
  delegate :title, :text, :image

  def created_at_str
    object.created_at.strftime("%d/%m/%Y в %H:%M")
  end

  def truncated_text
    h.truncate(text,
      length: 255,
      separator: ' ',
      omission: '... ') { read_more_link }
  end

  private

  def read_more_link
    h.link_to "Читать полностью", "#show",
      data: { url: h.article_path(article) }, class: "js-open-modal"
  end
end
