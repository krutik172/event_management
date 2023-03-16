Rails.application.routes.draw do
  devise_for :users
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "events#index"
  get "events/index", to: "events#index"
  get "events/organised", to: "events#organised"
  get "events/enroll/:id", to: "events#enroll"
  get "events/details/:id", to: "comments#index"
  get "events/details/:event_id/like/:comment_id", to: "comments#like"
  get "events/details/:event_id/unlike/:comment_id", to: "comments#unlike"
  # get "events/:id/edit", to: "events#edit"
  # post "events/update/:id", to: "events#update", as: :update_event

  get  "/search", to: "employees#search"
  resources :events
  resources :comments
  resources :employees
end
