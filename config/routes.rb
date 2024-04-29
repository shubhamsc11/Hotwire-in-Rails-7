Rails.application.routes.draw do
  get 'home/index'
  get 'other/index'
  get '/users/index'
  get '/users/search' => 'users#search', as: 'search_user'

  # get '/home/turbo_frame_form' => 'home#turbo_frame_form', as: 'turbo_frame_form'
  post '/home/turbo_frame_submit' => 'home#turbo_frame_submit', as: 'turbo_frame_submit'
  post '/home/turbo_number_submit' => 'home#turbo_number_submit', as: 'turbo_number_submit'

  post '/other/post_something' => 'other#post_something', as: 'post_something'

  get '/users/last_five_users' => 'users#last_five_users', as: 'last_five_users'
  
  root to: "home#index"

  resources :users, only: %i[new create show]
end
