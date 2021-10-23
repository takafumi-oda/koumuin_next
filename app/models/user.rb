class User < ApplicationRecord
  has_secure_password
  has_many :posts, dependent: :nullify
  has_many :replies, dependent: :nullify
  has_many :likes, dependent: :nullify
  has_many :favorites, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :age, presence: true
  validates :organization, presence: true
  validates :job, presence: true
  validates :status, presence: true
  validates :password, presence: true, on: :password_update

  def active_user_name
    if self.active
      self.name
    else
      "退会したユーザー"
    end
  end
end
