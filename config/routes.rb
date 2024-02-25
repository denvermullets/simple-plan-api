Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :coach_student_booking_reviews
      resources :coach_student_bookings
      get 'coaches/available-session-slots', to: 'coaches#available_session_slots', as: :coaches_available_sessions
      resources :students
      resources :coaches
      get 'users', to: 'users#index', as: :users
    end
  end

  get 'up' => 'rails/health#show', as: :rails_health_check
end
