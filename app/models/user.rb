class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  belongs_to :shop, optional: true
end
