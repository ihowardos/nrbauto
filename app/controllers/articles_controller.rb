class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  expose_decorated :article
  expose_decorated :articles, -> { fetch_articles }

  respond_to :json

  def show
    respond_with article, serializer: ArticleSerializer
  end

  private

  def fetch_articles
    Article.all.page(params[:page]).per(9).order(created_at: :desc)
  end
end
