Rails.application.routes.draw do

  devise_for :users
  root to: "direct_messages#index"
  resources :chatroom
  post '/create' => "chatroom#create"
  post '/message' => "direct_messages#message"

  resources :direct_messages

  mount ActionCable.server => '/cable'
end
