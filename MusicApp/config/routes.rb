Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show, :new, :create]
  resource :session, only: [:new, :create, :destroy]

  resources :bands do
    # provides a route to get all the articles for a given magazine.
    resources :albums, only: :new
  end

  resources :albums, except: [:index, :new] do
    # provides a route to get all the articles for a given magazine.
    resources :tracks, only: [:new]
  end

  resources :tracks, only: [:create, :edit, :show, :update, :destroy]

end
