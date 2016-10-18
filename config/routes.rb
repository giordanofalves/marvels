Rails.application.routes.draw do
  root "characters#index"
  resources :characters, only: :index

  scope :characters do
    get "update_view/:letter" => "characters#update_view", as: "update_view"
  end

  devise_for :users, skip: :omniauth_callbacks

  devise_for :users,
              skip: [:session, :password, :registration, :confirmation],
              controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
end
