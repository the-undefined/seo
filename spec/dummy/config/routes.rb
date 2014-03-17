Rails.application.routes.draw do
  mount Seo::Engine => "/seo"
  resources :pages
end
