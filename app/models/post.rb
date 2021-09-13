class Post < ApplicationRecord
  belongs_to :user
  has_many :replies, dependent: :restrict_with_error

  validates :title, presence: true
  validates :content, presence: true
end
