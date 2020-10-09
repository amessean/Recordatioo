Rails.application.routes.draw do
  devise_for :users
  get "/contacts/:provider/contact_callback" => "contacts#contact_callback"
  get "/contacts/failure" => "contacts#failure"
  root to:"pages#home"
  resources :bookings
    get 'bookings/:id/show_photo' => 'bookings#show_photo', as: 'show_photo'
  resources :contacts
end
