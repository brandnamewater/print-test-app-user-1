class Shop < ActiveRecord::Base
  include ShopifyApp::SessionStorage
  has_many :store_products
  has_one :user

end
