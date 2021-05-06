Rails.application.routes.draw do
  #devise_for :users


  scope '(:locale)', locale: /#{I18n.available_locales.map(&:to_s).join('|')}/, defaults: { locale: "en" } do
    root to: 'home#index'

    namespace :api, {format: 'json'} do
      namespace :v1 do
        resources :searches, only: [:index]
      end
    end

    get "dashboard", to: 'dashboard#index'
    devise_for :users, controllers: {
      passwords: "users/passwords",
      sessions: "users/sessions",
      registrations: "users/registrations",
      confirmations: "users/confirmations"
    }
  end
end
