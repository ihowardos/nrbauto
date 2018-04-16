class FilterProductsByCategory < BaseQuery

  def all
    apply_products
    apply_category if category
    apply_order_by_title
  end

  private

  def apply_products
    @relation = relation
      .page(params[:page])
      .per(DEFAULT_PER)
  end

  def apply_category
    @relation = relation.where(category: category)
  end

  def apply_order_by_title
    @relation = relation.order(title: :asc)
  end

  def category
    Product.categories
      .include?(params[:category]) ? params[:category] : nil
  end
end
