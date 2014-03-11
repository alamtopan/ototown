Ototown::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root 'publics#home'

  namespace :backend do
    get '/', to: 'home#index'
    devise_for :admins, :controllers => { :sessions => "backend/admins/sessions" }
    resources :users
  end

end
