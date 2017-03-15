Rails.application.routes.draw do

 get 'courses/new'

 get 'courses/show'

 get 'courses/index'

 resources :courses

 get    '/courses',   to: 'courses#index'

 root 'courses#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
