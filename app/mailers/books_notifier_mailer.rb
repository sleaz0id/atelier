class BooksNotifierMailer < ApplicationMailer
  default from: 'warsztaty@infakt.pl'
  layout 'mailer'

  def book_taken(book, user, reservation)
    @book = book
    @user = user
    @reservation = reservation
    mail(to: user.email, subject: "You just borrowed the book \"#@book.title\"")
  end
end
