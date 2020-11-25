class Item < ApplicationRecord
  belongs_to :user
  has_one :chat

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
