class Package < ApplicationRecord
  belongs_to :service
  has_many :package_metrics
  has_many :order_items
  has_many :orders, through: :order_items
  has_many :buyers, through: :orders, source: :user
  has_many :cart_items

end
