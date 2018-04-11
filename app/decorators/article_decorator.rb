class ArticleDecorator < ApplicationDecorator
  delegate :title, :text

  def created_at_str
    object.created_at.strftime("%d/%m/%Y в %H:%M")
  end

  def truncated_text
    h.truncate(h.raw(text),
      length: 255,
      separator: ' ',
      omission: '... ') { read_more_link }
  end

  def image_url
    object.image ? object.image.url : default_url
  end

  private

  def read_more_link
    h.link_to "Читать полностью", "#show",
      data: { url: h.article_path(article) }, class: "js-open-modal"
  end

  def default_url
    ImageUploader.new.default_url
  end
end
