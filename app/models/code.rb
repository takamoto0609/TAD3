class Code < ApplicationRecord
  belongs_to :user

  validates :pass, uniqueness: true
end
