class ProductsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]

  expose_decorated :product
  expose_decorated :products, -> { fetch_products }
  expose :categories, -> { Product.categories }

  def create
    product.save

    respond_with product
  end

  def update
    product.update(product_params)

    respond_with product
  end

  private

  def product_params
    params.require(:product).permit(
      :title,
      :description,
      :category,
      :compatibility_model,
      :compatibility_oem,
      images: []
    )
  end

  def fetch_products
    FilterProductsByCategory.new(
      Product.all,
      category: params[:category],
      page: params[:page]
    ).all
  end
end
