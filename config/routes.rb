Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :tweets do
      collection do
        get :favorites, to: "tweets#favorites"
      end
     #   post :favorite, to: "tweets#add_favorite"
     #  delete :favorite, to: "tweets#remove_favorite"
      member do
        post :toggle_favorite, to: "tweets#toggle_favorite"
      end
    end
  end
end
