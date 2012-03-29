# -*- encoding : utf-8 -*-
ActiveAdmin.register User do
index do
  column :id
  column :email
  column :last_sign_in_at, :label =>'Last sign in'
  column :created_at
  default_actions
end

form do |f|
  f.inputs :email, :password, :password_confirmation
  f.buttons
end
end
