Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :bookings
  # get 'bookings/:id/show_photo' => 'bookings#show_photo', as: 'show_photo'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
