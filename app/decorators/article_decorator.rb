class ArticleDecorator < ApplicationDecorator
  delegate :id, :title, :text

  def created_at_str
    object.created_at.strftime("%d/%m/%Y в %H:%M")
  end

  def admin_truncated_text
    h.truncate_html(text,
      length: 255,
      separator: ' ',
      omission: '... ')
  end

  def truncated_text
    h.truncate_html(text,
      length: 255,
      separator: ' ',
      omission: "... #{read_more_link}")
  end

  def raw_text
    h.raw text
  end

  def image_url
    object.image ? object.image.url : default_url
  end

  private

  def read_more_link
    h.link_to "еще", "#show",
      data: { url: h.article_path(article) }, class: "js-open-modal"
  end

  def default_url
    ImageUploader.new.default_url
  end
end
