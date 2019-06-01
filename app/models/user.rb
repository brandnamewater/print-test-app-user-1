class User < ApplicationRecord
  include ShopifyApp::SessionStorage

  has_secure_password
  validates :email, presence: true, uniqueness: true
  belongs_to :shops
end
