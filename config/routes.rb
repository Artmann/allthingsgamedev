Rails.application.routes.draw do
  resources :articles

  get 'sitemap' => 'sitemap#index', format: :xml, as: :sitemap

  root 'articles#index'
end
