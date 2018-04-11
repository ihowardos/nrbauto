Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  devise_for :users, skip: %i(registrations)

  resources :articles, only: %i(index show)
  resources :products

  namespace :admin do
    resources :articles
  end

  as :user do
    get "users/edit", to: "users/registrations#edit", as: "edit_user_registration"
    put "users", to: "users/registrations#update"
  end

  get "/product", to: "pages#product"
  get "/products", to: "pages#products"

  root to: "pages#main"
end
