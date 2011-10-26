authorization do
  role :guest do
    has_permission_on :home, :to => [:index]
  end

  role :customer do
    includes :guest
    has_permission_on :profile, :to =>[:index, :info]
  end
end