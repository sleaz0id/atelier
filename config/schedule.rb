every 1.day, at: '8:00 am' do
  rake 'books_notifier:reservations_handler', environment: 'development' 
end
