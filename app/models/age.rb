class Age < ApplicationRecord
  has_many :users, dependent: :restrict_with_error

  validates :age, presence: true, uniqueness: true
end
