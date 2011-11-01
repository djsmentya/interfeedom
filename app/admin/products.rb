ActiveAdmin.register Product do

  index do
    column 'Product' do |product|
      image_tag(product.image.url(:thumb))
      #product.properties.genre
    end
    column :id
    column :name
    column :available_on
    column :created_at
    column :updated_at
    default_actions
  end
  #
  form do |f|
    f.inputs 'Product' do
      #    f.input :name
      f.input :product_type
      #f.input :description
      #    f.input :avalible_on
      #    f.input :image, :label => 'Product image'
      #    f.input :price
    end
    #

  end

  collection_action :new_product do
    @product = Product.new(params[:product])
    if params[:product_type].empty?
      redirect_to :action=> :new
    else
      render :partial => "#{params[:product_type]}", :locals => {:product => @product}
    end
  end
  #sidebar :fields do
  #  ul do
  #    li link_to('#')
  #  end
  #end
  #456465415
  #member_action :prop do
  #  if request.post?
  #    product = Product.find params[:id]
  #    Property.create(:product => product, :product_type_id => product.product_type_id, :value => params[:value])
  #    redirect :index
  #  end
  #end
  #collection_action
end
