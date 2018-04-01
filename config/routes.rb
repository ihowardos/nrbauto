Rails.application.routes.draw do
  devise_for :users, skip: %i(registrations)
  resources :articles

  as :user do
    get "users/edit", to: "users/registrations#edit", as: "edit_user_registration"
    put "users", to: "users/registrations#update"
  end

  get "/products", to: "pages#products"

  root to: "pages#main"
end
