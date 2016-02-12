Rails.application.routes.draw do
  localized do
    root "character#index"

    scope :characters do
      get "update_view/:letter" => "character#update_view", as: "update_view"
    end

    devise_for :users, skip: :omniauth_callbacks
  end

  devise_for :users,
              skip: [:session, :password, :registration, :confirmation],
              controllers: { :omniauth_callbacks => "users/omniauth_callbacks" }
end
