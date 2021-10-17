class Reply < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :likes, dependent: :destroy

  validates :content, presence: true
  validates :post_id, presence: true

  def like_by(user)
    likes.find { |like| like.user_id == user.id } if user
  end

  def self.search(keywords)
    if keywords
      self.where("content LIKE ?", "%#{keywords}%")
    else
      self.all
    end
  end
end
