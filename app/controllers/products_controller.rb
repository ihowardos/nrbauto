class ProductsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]

  expose_decorated :product
  expose_decorated :products, -> { fetch_products }
  expose :categories, -> { Product.categories }

  private

  def fetch_products
    FilterProductsByCategory.new(
      Product.all,
      category: params[:category],
      page: params[:page]
    ).all
  end
end
