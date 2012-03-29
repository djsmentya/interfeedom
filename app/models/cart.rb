# -*- encoding : utf-8 -*-
class Cart
  attr_reader :items

  def initialize
    @items = {}
  end

  def << (product_id, quantity = 1)
    if @items[product_id].present?
      @items[product_id] += 1
    else
      @items.[]= product_id, quantity
    end
  end

  def item_quantity(product_id)
    @items[product_id]
  end
end
