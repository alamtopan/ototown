Ototown::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root 'publics#home'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  #Dealers
  get   '/dealers',           to: 'dealers#dealers',           as: 'dealers'
  get   '/detail_dealer',     to: 'dealers#detail_dealer',     as: 'detail_dealer'

  #Cars
  get   '/cars',              to: 'cars#cars',                 as: 'cars'
  get   '/detail_car',        to: 'cars#detail_car',           as: 'detail_car'
  get   '/form_car',          to: 'cars#form_car',             as: 'form_car'

  #News
  get   '/detail_news/:id',				to: 'publics#detail_news',       as: 'detail_news'
  get   '/news',     					to: 'publics#news',              as: 'news'

  #Users
  get   '/user_home',         to: 'users#user_home',           as: 'user_home'
  get   '/user_profile',      to: 'users#user_profile',        as: 'user_profile'
  put   '/user_profile',      to: 'users#update',              as: 'user_update'

  namespace :backend do
    get '/',                  to: 'home#index'                 
    devise_for :admins, :controllers => { :sessions => "backend/admins/sessions" }
    resources :admins  do
      resources :profiles
    end
    resources :users do
      member do
        get 'add-to-dealer', to: 'users#add_dealer', as: 'add_dealer'
      end
    end
    resources :dealers
    resources :news
    resources :category_news
    resources :categories
    resources :brands
    resources :models
    resources :types
    resources :cars
    resources :spareparts
    resources :page_contents
    resources :web_settings
  end

end
