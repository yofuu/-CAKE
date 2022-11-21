Rails.application.routes.draw do
  # devise_for :order_details
  # devise_for :orders
  # devise_for :cart_items
  # devise_for :genres
  # devise_for :customers
  # devise_for :items
  # devise_for :admins
  # devise_for :addresses

  get 'about'=>'public/homes#about',as:'about'
  root to: 'public/homes#top'
  scope module: :public do
  resources :items
  resources :customers
  end

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

   namespace :admin do
     root to: 'homes#top'
     resources :items

     resources :customers
   end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
