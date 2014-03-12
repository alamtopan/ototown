Ototown::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root 'publics#home'
  namespace :backend do
    get '/', to: 'home#index'
  end
end
