class Reservation < ApplicationRecord
  self.table_name = 'book_reservations'
  belongs_to :book
  belongs_to :user

  before_create :set_expiration

  scope :active, -> { where(status: ['TAKEN', 'RESERVED']).order(created_at: :desc) }

  private

  def set_expiration
    self.expires_at = Time.now + 2.weeks
  end
end
