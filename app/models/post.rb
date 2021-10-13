class Post < ApplicationRecord
  belongs_to :user
  has_many :replies, dependent: :restrict_with_error
  has_many :favorites, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true

  def favorite_by(user)
    favorites.find { |favorite| favorite.user_id == user.id } if user
  end

  def self.search(search)
    if search
      Post.where("title LIKE ? OR content LIKE ?", "%#{search}%", "%#{search}%")
    else
      Post.all
    end
  end

  def most_recent_update
    if self.replies.present?
      self.replies.order("created_at DESC").first.created_at
    else
      self.created_at
    end
  end

  def replies_count
    self.replies.where(parent_id: nil).count
  end
end
