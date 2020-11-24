Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"

  resources :items do
    collection do
      get 'search'
    end
    resources :chats
  end
  resources :wallets do
  collection do
    get 'code_to_point'
    get 'point_to_code'
  end
  end
  resources :codes
end
