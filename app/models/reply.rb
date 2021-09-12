class Reply < ApplicationRecord
  belongs_to :user
  belongs_to :post_id

  validates :content, presence: true
  validates :post_id, presence: true
end
