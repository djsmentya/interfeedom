authorization do
  role :guest do
    has_permission_on :home, :to => [:index]
  end
end