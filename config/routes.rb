Rails.application.routes.draw do

  resources :catalog do
    collection do
      get 'search'
    end
  end

  #get 'catalogs/search'

  root 'catalogs#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
