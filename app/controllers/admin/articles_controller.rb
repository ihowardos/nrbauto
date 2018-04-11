module Admin
  class ArticlesController < ApplicationController
    before_action :authenticate_user!
    expose_decorated :article
    expose_decorated :articles, -> { fetch_articles }

    def show
      respond_with article
    end

    def create
      article.save

      respond_with article, location: admin_articles_path
    end

    def update
      article.update(article_params)

      respond_with article, location: admin_articles_path
    end

    def destroy
      article.destroy

      respond_with article, location: admin_articles_path
    end

    private

    def article_params
      params.require(:article).permit(:title, :text, :image)
    end

    def fetch_articles
      Article.all.page(params[:page]).per(10).order(created_at: :desc)
    end
  end
end
