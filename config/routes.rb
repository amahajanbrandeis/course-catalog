Rails.application.routes.draw do

  resources :enrollments
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

    post 'enrollments/search'

    post 'courses/enroll'

    resources :catalog do
      collection do
        get 'search'
      end
    end
    resources :subjects
    resources :courses
    resources :instructors
    resources :sessions
    resources :users
    resources :enrollments

   get    '/signup',   to: 'users#new'
   get    '/login',    to: 'sessions#new'
   post   '/login',    to: 'sessions#create'
   delete '/logout',   to: 'sessions#destroy'
   get    '/courses',  to: 'courses#index'
   get    '/search',   to: 'enrollments#index'
   get 'enrollments/search', to: 'enrollments#index'

  root 'sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
