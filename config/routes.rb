Rails.application.routes.draw do
  resources :memos, default: {format: :json}, only: :create
end
