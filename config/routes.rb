Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  localized do
    # Sidekiq Web UI, only for admins.
    require "sidekiq/web"
    authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
    end
    resources :posts do
      member do
        patch 'translations', to: 'posts#update_translations'
      end
    end
    resources :homepages, only: [:show, :new, :create, :edit, :update]
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
    root to: "homepages#show"
    get "legal-notice", to: "pages#legal"
    get "about-us", to: "pages#about_us"
    # get "contact", to: "contacts#new", as: "contact"
    get "vacation-rentals", to: "pages#vacation_rentals"
    get "dashboard", to: "pages#dashboard"
    get 'thank-you', to: 'pages#thank_you'
  end
  # scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
  #   scope(path_names: { new: 'nou', edit: 'modificar', sign_in: 'entrar', sign_up: 'registrar_se', password: 'contrasenya'}) do
  #   end
  # end
end
