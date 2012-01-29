ActiveAdmin.register Order do
  actions :index, :show, :destroy
  index  do
    column :id
    column('State'){|order| status_tag(order.state)}
    column('Payment State' ) do
      div 'as'
    end
    column :recipient
    column :phone
    #column 'Products' do |o|
    #if products = Product.find(o.order_item_ids)
    #products.each do |p
    #p.name
    #end
    #end
    #end
    default_actions
  end
  show do
    panel 'Order' do
      table_for(order.order_items) do |t|
        t.column('Product') {|item| auto_link item.product                }
        t.column("Price")   {|item| number_to_currency item.product.price }
        tr  do
          td "Total:", :style => "text-align: right;"
          td number_to_currency(order.total_price)
        end
      end
    end
    active_admin_comments
  end

  sidebar :customer_information, :only => :show do
    attributes_table_for order.user do
      row("User") { auto_link order.user }
      row :email
    end
  end
end
