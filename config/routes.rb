require 'sidekiq/web'

Rails.application.routes.draw do

  devise_for :users
  
  mount Sidekiq::Web => '/sidekiq'

  root to: "books#index"

  get 'books/:book_id/reserve', to: 'reservations#reserve', as: 'reserve_book'
  get 'books/:book_id/take', to: 'reservations#take', as: 'take_book'
  get 'books/:book_id/give_back', to: 'reservations#give_back', as: 'give_back_book'
  get 'books/:book_id/cancel_reservation', to: 'reservations#cancel', as: 'cancel_book_reservation'
  get 'users/:user_id/reservations', to: 'reservations#users_reservations', as: 'users_reservations'
  get 'books/filter', to: 'books#filter', as: 'filter'
  get 'google-isbn', to: 'google_books#show'

  get 'api/v1/books/lookup', to: 'api/v1/books#lookup'

  resources :books do
    collection do
      get 'by_category/:name', action: :by_category
    end
  end
end
