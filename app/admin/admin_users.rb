ActiveAdmin.register AdminUser do
  index do
    column :email
    column :current_sign_in_at
    default_actions
  end
  form do |f|
    f.inputs :email, :password, :password_confirmation
    f.buttons
  end
end
