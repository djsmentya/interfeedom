authorization do
  role :guest do
    has_permission_on :home, :to => [:index]
  end

  role :customer do
    includes :guest
    has_permission_on :profile, :to =>[:index, :info, :new, :create, :update, :edit] do
      if_attribute :user_id => is {current_user.id}
    end
  end

  role :saler do
    includes :guest
  end
end
