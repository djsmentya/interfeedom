class Cart
  attr_reader :items

  def initialize
    @items = {}
  end

  def << (product_id, quantity = 1)
    @items.[]= product_id, quantity
  end

  def item_quantity(product_id)
      @items[product_id]
  end
end