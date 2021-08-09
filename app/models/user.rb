class User < ApplicationRecord
  has_secure_password
  belongs_to :age
  belongs_to :organization
  belongs_to :job

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :age_id, presence: true
  validates :organization_id, presence: true
  validates :job_id, presence: true
end
