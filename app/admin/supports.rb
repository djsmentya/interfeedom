# -*- encoding : utf-8 -*-
ActiveAdmin.register Support do
 menu :label => 'Звернення до адміністрації' , :parent => 'Зв’язок'

 index do
  column :id
  column :subject
  column :email do |s|
    mail_to s.email
  end

  column :message
  column :created_at
  column :actions do |s|
      link_to( I18n.t(:destroy ), admin_support_path(s), :method=> :delete)
  end
 end
end
