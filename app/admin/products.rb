# -*- encoding : utf-8 -*-
ActiveAdmin.register Product do
  actions :index, :edit, :destroy, :show
  filter :price
  filter :genre
  filter :created_at
  filter :updated_at
  filter :count_on_hand
  filter :producer
  filter :style
  filter :group
  filter :album

  scope I18n.t(:all), :all
  scope I18n.t('active_admin.scopes.audio'), :audio
  scope I18n.t('active_admin.scopes.video'), :video
  
  form :partial => "form"
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


  sidebar :product_types,:partial => 'sidebar', :only => :new

  collection_action :new_product do
    @product = Product.new(params[:product])
    if params[:product_type].empty?
      render :nothing      
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
