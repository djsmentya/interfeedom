ActiveAdmin.register AdminUser do
  index do
    column :email
    column :current_sign_in_at
    default_actions
  end
end
