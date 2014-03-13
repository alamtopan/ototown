Ototown::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root 'publics#home'

  get   '/detail_news',				to: 'publics#detail_news',	as: 'detail_news'
  get   '/news',     					to: 'publics#news',         as: 'news'
  get   '/cars',    					to: 'publics#cars',         as: 'cars'
  get   '/detail_car',    		to: 'publics#detail_car',   as: 'detail_car'
  get   '/dealers',    				to: 'publics#dealers',      as: 'dealers'
  get   '/user_home',         to: 'publics#user_home',    as: 'user_home'
  get   '/user_profile',      to: 'publics#user_profile', as: 'user_profile'
  get   '/form_car',          to: 'publics#form_car',     as: 'form_car'

  namespace :backend do
    get '/', to: 'home#index'
    devise_for :admins, :controllers => { :sessions => "backend/admins/sessions" }
    resources :users
  end

end
