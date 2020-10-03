Rails.application.routes.draw do
  devise_for :users
  root to:"pages#home"
  resources :bookings
    get 'bookings/:id/show_photo' => 'bookings#show_photo', as: 'show_photo'
end
