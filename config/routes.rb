Rails.application.routes.draw do

  get 'instructors/new'

  get 'instructors/show'

  get 'instructors/index'

  get 'courses/new'

  get 'courses/show'

  get 'courses/index'

  get 'subjects/new'
  get 'subjects/show'

  get 'sessions/new'
  get 'users/new'

  resources :catalog do
    collection do
      get 'search'
    end
  end

  resources :subjects
  resources :courses
  resources :instructors
  resources :sessions

 get    '/signup',   to: 'users#new'
 get    '/login',    to: 'sessions#new'
 post   '/login',    to: 'sessions#create'
 delete '/logout',   to: 'sessions#destroy'
 resources :users


  #get 'catalogs/search'

 root 'sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
