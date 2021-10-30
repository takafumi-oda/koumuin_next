class User < ApplicationRecord
  has_secure_password
  has_many :posts, dependent: :nullify
  has_many :replies, dependent: :nullify
  has_many :likes, dependent: :nullify
  has_many :favorites, dependent: :destroy

  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, on: :password_update, length: { minimum: 6 }
  validates :age, presence: true
  validates :organization, presence: true
  validates :job, presence: true
  validates :status, presence: true
  validates :introduction, length: { maximum: 100 }

  def active_user_name
    if self.active
      self.name
    else
      "退会したユーザー"
    end
  end
end
