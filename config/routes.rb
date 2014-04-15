Ototown::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root 'publics#home'
  get  '/search', to: 'publics#search'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  #Dealers
  get   '/dealers',           to: 'dealers#dealers',           as: 'dealers'
  get   '/detail_dealer/:id', to: 'dealers#detail_dealer',     as: 'detail_dealer'
  get   '/dealers/search',    to: 'dealers#search',            as:  'dealer_search'

  #Cars
  get   '/cars/:condition',   to: 'cars#cars',                 as: 'cars'
  get   '/detail_car/:id',    to: 'cars#detail_car',           as: 'detail_car'

  #Spareparts
  get   '/spareparts',   to: 'spareparts#spareparts',        as: 'spareparts'
  get   '/detail_sparepart/:id',    to: 'spareparts#detail_sparepart',           as: 'detail_sparepart'

  #News
  get   '/detail_news/:id',		to: 'publics#detail_news',       as: 'detail_news'
  get   '/news',     					to: 'publics#news',              as: 'news'
  get   '/tips',              to: 'publics#tips',              as: 'tips'

  # Compare
  get 'compare-product/:id',  to: 'publics#compare',           as: 'compare'
  get 'compare-products',     to: 'publics#compare_products',  as: 'compare_products'
  delete 'compare-products',  to: 'publics#delete_compare',    as: 'delete_compare_product'

  #Pages
  get   '/page/:id',          to: 'publics#page',              as: 'page'

  #Users
  get   '/user_home',         to: 'users#user_home',           as: 'user_home'
  get   '/user_profile',      to: 'users#user_profile',        as: 'user_profile'
  put   '/user_profile',      to: 'users#update',              as: 'user_update'

  scope :user do
    resources :products
    post '/mass_actions',             to: 'products#mass_actions',     as: 'mass_actions'
    get '/archive_products',          to: 'products#archive',          as: 'archive_products'
    put '/change_status/:product_id', to: 'products#change_status',    as: 'change_status'
    post '/be-a-dealer',              to: 'users#be_dealer',           as: 'be_dealer'
    post '/edit-be-a-dealer',         to: 'users#edit_be_dealer',           as: 'edit_be_dealer'
  end

  # Product



  get   '/brand_model',       to: 'publics#brand_model',         as: 'brand_model'

  namespace :backend do
    get '/',                  to: 'home#index'
    devise_for :admins, :controllers => { sessions: "backend/admins/sessions" }
    resources :admins  do
      resources :profiles
    end
    resources :users do
      member do
        get 'add-to-dealer', to: 'users#add_dealer', as: 'add_dealer'
      end
    end
    resources :dealers do
      collection do
        get 'dealers_request', to: 'dealers#dealers_request', as: 'dealers_request'
        get 'approve_dealer/:id', to: 'dealers#approve_dealer', as: 'approve_dealer'
        get 'unapprove_dealer/:id', to: 'dealers#unapprove_dealer', as: 'unapprove_dealer'
      end
    end
    resources :news
    resources :category_news
    resources :categories
    resources :brands
    resources :models
    resources :types
    resources :cars
    resources :advertises
    resources :spareparts
    resources :page_contents
    resources :web_settings
    resources :advertisements
  end

end
