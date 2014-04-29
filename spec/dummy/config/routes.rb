Rails.application.routes.draw do
  resources :articles


  mount Seo::Engine => "/seo"
  resources :pages
end
