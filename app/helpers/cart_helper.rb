module CartHelper
  def link_to_add_product(product, options = {})
    link_to t(:to_cart), add_item_cart_index_path(:product_id => product.id), options
  end

end
