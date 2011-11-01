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

  def categoried_product_path(product)
    case                    #TODO watch for metaprogramming way of path selection
      when product.product_type.name.eql?('Video')
        video_path(product)
    end
  end
end
