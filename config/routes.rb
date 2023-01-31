Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  localized do

    # Sidekiq Web UI, only for admins.
    require "sidekiq/web"
    require 'sidekiq/cron/web'
    authenticate :user, ->(user) { user.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end

    resources :posts
    resources :titles, only: [:show, :new, :create, :edit, :update]
    resources :webrealestates
    resources :images
    resources :contacts
    resources :features

    resources :categories
    resources :reviews
    resources :towns
    resources :realestates do
      collection do
        get "index_map"
      end
      collection do
        patch "set_featured"
      end
      resources :photos, only: :destroy, shallow: true
    end
    devise_for :users
    root to: "pages#home"
    get "legal-notice", to: "pages#legal"
    get "about-us", to: "pages#about_us"
    # get "contact", to: "contacts#new", as: "contact"
    get "vacation-rentals", to: "pages#vacation_rentals"
    get "dashboard", to: "pages#dashboard"
    get 'thank-you', to: 'pages#thank_you'
  end
end
