class User < ApplicationRecord
  has_secure_password
  belongs_to :age
  belongs_to :organization
  belongs_to :job
  belongs_to :status
  has_many :posts, dependent: :nullify
  has_many :replies, dependent: :nullify
  has_many :likes, dependent: :nullify

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :age_id, presence: true
  validates :organization_id, presence: true
  validates :job_id, presence: true
  validates :status_id, presence: true
  validates :password, presence: true, on: :password_update
end
