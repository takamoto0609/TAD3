class ChangePoint < ApplicationRecord
  belongs_to :user

  validates :pass, presence: true
  validates :point, presence: true
end
