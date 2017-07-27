class Item < ApplicationRecord
  has_many :bookings
  has_many :reviews
  has_many :custom_fields

  belongs_to :borrower, class_name: 'User', foreign_key: 'user_id', optional: true
end
