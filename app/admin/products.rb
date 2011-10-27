ActiveAdmin.register Product do
  index do
    column 'Product' do |product|
      image_tag(product.image.url(:thumb))
      #product.properties.genre
    end
    column :id
    column :name
    column :avalible_on
    column :created_at
    column :updated_at
    default_actions
  end

  form do |f|
    f.inputs 'Product' do
      f.input :name
      f.input :description
      #f.datepicker_input :avalible_on, :div
      f.input :image, :label => 'Product image'
    end

    f.buttons
  end
  sidebar :fields do
    ul do
      li link_to('#')
    end
  end

  collection_action :set_fields do

  end
end
