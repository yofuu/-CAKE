Rails.application.routes.draw do
  # devise_for :order_details
  # devise_for :orders
  # devise_for :cart_items
  # devise_for :genres
  # devise_for :customers
  # devise_for :items
  # devise_for :admins
  # devise_for :addresses
  
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
  
   namespace :admin do
     resources :items
     get :customers
   end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
