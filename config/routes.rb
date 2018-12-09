Rails.application.routes.draw do
  resources :articles

  get 'talks' => 'talks#index', as: :talks
  get 'talks/:id' => 'talks#show', as: :talk

  get 'sitemap' => 'sitemap#index', format: :xml, as: :sitemap

  root 'articles#index'
end
