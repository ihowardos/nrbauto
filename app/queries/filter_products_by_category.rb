class FilterProductsByCategory < BaseQuery

  def all
    apply_products
    apply_order_by_title
  end

  private

  DEFAULT_FILTER = %w(fuel_cap).freeze

  def apply_products
    @relation = relation
      .where(category: category)
      .page(params[:page])
      .per(DEFAULT_PER)
  end

  def apply_order_by_title
    @relation = relation.order(title: :asc)
  end

  def category
    Product.categories
      .include?(params[:category]) ? params[:category] : DEFAULT_FILTER
  end
end
