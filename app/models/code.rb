class Code < ApplicationRecord
  belongs_to :user

  validates :pass, presence: true, uniqueness: true
  validates :point, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
end
