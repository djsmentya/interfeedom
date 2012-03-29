# -*- encoding : utf-8 -*-
authorization do
  role :guest do
    has_permission_on :home, :to => [:index]
  end

  role :customer do
    includes :guest
    has_permission_on :profile, :to =>[:index, :info, :new, :create, :update, :edit, :make_as_saler] do
      if_attribute :user_id => is {current_user.id}
    end
  end

  role :saler do
    has_permission_on :profile_products, :to => [:index, :show, :new, :create,:update, :edit, 
                                                 :load_product_type]

  end
end
