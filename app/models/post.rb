class Post < ApplicationRecord
  belongs_to :user
  has_many :replies, dependent: :restrict_with_error
  has_many :favorites, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true

  def favorite_by(user)
    favorites.find { |favorite| favorite.user_id == user.id } if user
  end
end
