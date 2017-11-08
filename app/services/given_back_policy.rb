class GivenBackPolicy
  def initialize(user:, book:)
    @user = user
    @book = book
  end

  def applies?
    reservations.present?
  end

  private
  attr_reader :user, :book

  def reservations
    book.reservations.find_by(user: user, status: 'TAKEN')
  end
end
