class Job < ApplicationRecord
  has_many :users, dependent: :restrict_with_error

  validates :job, presence: true, uniqueness: true
end
