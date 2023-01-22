Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'



  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    scope(path_names: { new: 'nou', edit: 'modificar', sign_in: 'entrar', sign_up: 'registrar_se', password: 'contrasenya'}) do

      # Sidekiq Web UI, only for admins.
      require "sidekiq/web"
      require "sidekiq/cron/web"
      authenticate :user, ->(user) { user.admin? } do
      mount Sidekiq::Web => '/sidekiq'
      end
      resources :images
      resources :contacts, path: "contactes"
      resources :features, path: 'caracteristiques'
      resources :posts, path: 'noticies'
      resources :categories, path: 'categories'
      resources :reviews
      resources :towns
      resources :realestates, path: 'immobles' do
        collection do
          get "index_map"
        end
        collection do
          patch "set_featured"
        end
      end
      devise_for :users
      root to: "pages#home"
      get "avis-legal", to: "pages#legal"
      get "sobre-nosaltres", to: "pages#about_us"
      get "contacte", to: "contacts#new"
      get "lloguer-turistic", to: "pages#vacation_rentals"
      get "control-panel", to: "pages#dashboard"

      # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

      # Defines the root path route ("/")
      # root "articles#index"
    end
  end
end
