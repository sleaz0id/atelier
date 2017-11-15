class BooksNotifierMailer < ApplicationMailer
  default from: 'warsztaty@infakt.pl'
  layout 'mailer'

  def book_taken(book, user, reservation)
    @book = book
    @user = user
    @reservation = reservation
    mail(to: user.email, subject: "You just borrowed the book \"#@book.title\"")
  end

  def return_reminder(book)
    @book = book
    @reservation = book.reservations.find_by(status: "TAKEN")
    @borrower = @reservation.user

    mail(to: @borrower.email, subject: "Upływa termin zwrotu książki #{@book.title}") 
  end

  def book_reserved_return(book)
    @book = book
    @reservation = book.reservations.find_by(status: "RESERVED")
    return "Brak oczekujących czytelników" unless @reservation
    @next_borrower = @reservation.user
    return "Brak kolejnej rezerwacji" unless @next_borrower

    mail(to: @next_borrower.email, subject: "Zarezerwowana książka #{book.title} niebawem będzie gotowa do odbioru")
  end
end
