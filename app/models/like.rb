class Like < ApplicationRecord
  belongs_to :user
  belongs_to :reply

  validates :reply_id, uniqueness: { scope: :user_id }
end
