module ProductsHelper
  def product_states(product)
    new = ''
    if product.created_at >= 2.weeks.ago
      new = "<div class='state'> NEW </div>"
    end
    if product.available?
      available = "<div class='state'> AVAILABLE </div>"
    else
      available = "<div class='state'>NOT AVAILABLE </div>"
    end
    #if new.nil?
      #raw available
    #else
      raw new + available
    #end
  end

  def categoried_product_path(product)
    instance_eval (product.product_type.downcase + '_path product')
  end
end
