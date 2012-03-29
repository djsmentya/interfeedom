# -*- encoding : utf-8 -*-
Interfreedom::Application.routes.draw do

  resources :videos do
    resources :comments
  end

end
