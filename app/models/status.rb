class Status < ApplicationRecord
  has_many :users, dependent: :restrict_with_error

  validates :category, presence: true, uniqueness: true
end
