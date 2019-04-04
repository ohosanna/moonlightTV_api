Rails.application.routes.draw do

  namespace :live do
    resources :groups, controller: "live_groups" do
      resources :channels, only: [:index, :new, :create]
    end
    resources :channels, only: [:show, :edit, :update, :destroy] do
      resources :sources, only: [:index, :new, :create]
    end
    resources :sources, only: [:show, :edit, :update, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
