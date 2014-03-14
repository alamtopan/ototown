Ototown::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root 'publics#home'

  #Dealers
  get   '/dealers',           to: 'dealers#dealers',           as: 'dealers'
  get   '/detail_dealer',     to: 'dealers#detail_dealer',     as: 'detail_dealer'

  #Cars
  get   '/cars',              to: 'cars#cars',                 as: 'cars'
  get   '/detail_car',        to: 'cars#detail_car',           as: 'detail_car'
  get   '/form_car',          to: 'cars#form_car',            as: 'form_car'

  #News
  get   '/detail_news',				to: 'publics#detail_news',       as: 'detail_news'
  get   '/news',     					to: 'publics#news',              as: 'news'

  #Users
  get   '/user_home',         to: 'users#user_home',           as: 'user_home'
  get   '/user_profile',      to: 'users#user_profile',        as: 'user_profile'

  namespace :backend do
    get '/', to: 'home#index'
    devise_for :admins, :controllers => { :sessions => "backend/admins/sessions" }
    resources :users
    resources :categories
  end

end
