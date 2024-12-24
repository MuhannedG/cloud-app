Rails.application.routes.draw do
  # Devise routes for user authentication
  devise_for :users

  # Nested comments under posts
  resources :posts do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end

  resources :events

  # Root path depending on user authentication
  authenticated :user do
    root "posts#index", as: :authenticated_root
  end

  unauthenticated do
    root "devise/sessions#new", as: :unauthenticated_root
  end

  # Health check endpoint for monitoring
  get "up" => "rails/health#show", as: :rails_health_check

  # Dynamic PWA files
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end

