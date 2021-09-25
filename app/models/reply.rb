class Reply < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :likes

  validates :content, presence: true
  validates :post_id, presence: true

  def like_by(user)
    likes.find { |like| like.user_id == user.id } if user
  end
end
