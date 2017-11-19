namespace :books_notifier do
  desc "Remind user about book return and notify next reserver"
  task reservations_handler: :environment do
    reservations = Reservation.where("status = 'TAKEN' AND expires_at = ?", Date.tomorrow)
    reservations.each do |reservation|
      book = reservation.book
      BooksNotifierMailer.return_reminder(book).deliver
      BooksNotifierMailer.book_reserved_return(book).deliver
    end
  end
end
