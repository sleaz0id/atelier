class ReservationsHandler
  def initialize(user)
    @user = user 
  end

  def take(book)
    return "Book is not available for reservation" unless book.can_be_taken_by(user)

    if book.available_reservation.present?
      reservation = book.available_reservation
      reservation.update_attributes(status: 'TAKEN')
    else
      reservation = book.reservations.create(user: user, status: 'TAKEN')
    end
    BooksNotifierMailer.book_taken(book, user, reservation).deliver_now if reservation
  end

  def give_back(book)
    return unless GivenBackPolicy.new(user: user, book: book).applies?

    ActiveRecord::Base.transaction do
      book.taken_reservation.update_attributes(status: 'RETURNED')
      book.next_in_queue.update_attributes(status: 'AVAILABLE') if book.next_in_queue.present?
    end
  end

  def reserve(book)
    return unless book.can_be_reserved_by(user)
    book.reservations.create(user: user, status: 'RESERVED')
  end

  def cancel_reservation(book)
    book.reservations.where(user: user, status: 'RESERVED').order(created_at: :asc).first.update_attributes(status: 'CANCELED')
  end

  private
    attr_reader :user

    def perform_expiration_worker(res)
      ::BookReservationExpireWorker.perform_at(res.expires_at-1.day, res.book_id)
    end
end
