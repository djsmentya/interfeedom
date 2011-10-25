module ProductsHelper
  def product_states(product)
    new =nil
    if product.created_at >= 2.weeks.ago
      new = "<div class='state'> NEW </div>"
    end
    if product.available?
      available = "<div class='state'> AVAILABLE </div>"
    else
      available = "<div class='state'>NOT AVAILABLE </div>"
    end
    raw new + available
  end
end
