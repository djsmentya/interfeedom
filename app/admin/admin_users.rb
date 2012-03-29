# -*- encoding : utf-8 -*-
ActiveAdmin.register AdminUser do
  menu :parent => 'Адміністрування'
filter :email
filter :created_at
  index do
    column :email
    column :last_sign_in_at
    default_actions
  end
  form do |f|
    f.inputs :email, :password, :password_confirmation
    f.buttons
  end

  show do |admin_user|
    attributes_table do
        row :email
        row :last_sign_in_at
        row :current_sign_in_at
        row :created_at
        row :updated_at
    end
  end
end
