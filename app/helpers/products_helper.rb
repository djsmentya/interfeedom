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
    if new.nil?
      raw available
    else
      raw new + available
    end
  end

  def categoried_product_path(product)
    instance_eval (product.product_type.name.downcase + '_path product')

    #case                    #TODO watch for metaprogramming way of path selection
      #when product.product_type.name.eql?('Video')
        #video_path(product)
      #when product.product_type.name.eql?('Video')
        #audio_path(product)
    #end
  end
end
