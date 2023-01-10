Rails.application.routes.draw do
  resources :reviews
  resources :towns
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    scope(path_names: { new: 'nou', edit: 'modificar', sign_in: 'entrar', sign_up: 'registrar_se', password: 'contrasenya'}) do
      resources :images
      resources :features, path: 'caracteristiques'
      resources :realestates, path: 'immobles' do
        collection do
          get "index_map"
        end
      end
      devise_for :users
      root to: "pages#home"
      get "noticies", to: "pages#news"
      get "sobre-nosaltres", to: "pages#about_us"
      get "contacte", to: "pages#contact"
      get "nostres-serveis", to: "pages#our_services"
      get "lloguer-turistic", to: "pages#vacation_rentals"
      # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

      # Defines the root path route ("/")
      # root "articles#index"
    end
  end
end
