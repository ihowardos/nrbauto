class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  expose_decorated :article

  def create
    article.save

    respond_with article
  end

  def update
    article.update(article_params)

    respond_with article
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :date, :image)
  end
end
