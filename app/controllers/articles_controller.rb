class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  expose_decorated :article
  expose_decorated :articles, -> { fetch_articles }

  respond_to :json

  def show
    respond_with article, serializer: ArticleSerializer
  end

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

  def fetch_articles
    Article.all.page(params[:page]).per(10).order(date: :desc)
  end
end
