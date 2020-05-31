Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :last_btc_prices, only: [:index]
  resources :prices, only: [:index]


  root to: 'prices#index'

end
