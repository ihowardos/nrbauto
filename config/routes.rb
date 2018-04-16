Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  devise_for :users, skip: %i(registrations)

  resources :articles, only: %i(index show)
  resources :products, only: %i(index show)
  resources :feedbacks, only: %i(index create)

  namespace :admin do
    resources :articles
    resources :products
  end

  as :user do
    get "users/edit", to: "users/registrations#edit", as: "edit_user_registration"
    put "users", to: "users/registrations#update"
  end

  get "/product", to: "pages#product"
  get "/products", to: "pages#products"
  get "/contacts", to: "pages#contacts"

  root to: "pages#main"
end
