class Product < ApplicationRecord
  # include ShopifyApp::SessionStorage

  # belongs_to :shop
  # attr_accessible :vendor, :title, :product_type




  belongs_to :category, foreign_key: :category_id, class_name: "Category"
  belongs_to :style, foreign_key: :style_id, class_name: "Style"
  #
  #
  attr_accessor :new_category_name
  before_save :create_category_from_name

  # has_many :orders

  # has_one :vendor


  def create_category_from_name
    create_category(name: new_category_name) unless new_category_name.blank?
  end

  attr_accessor :new_style_name
  before_save :create_style_from_name




  def create_style_from_name
    create_category(name: new_style_name) unless new_style_name.blank?
  end

  has_and_belongs_to_many :store_products
  # belongs_to :user_products
  # has_many :user_products

  # belongs_to :vendor_products
  # has_one :vendor_product

end
