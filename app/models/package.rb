# == Schema Information
#
# Table name: packages
#
#  id              :integer          not null, primary key
#  name            :string
#  service_id      :integer
#  price           :integer
#  description     :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  is_commercial   :boolean
#  revision_number :integer
#  delivery_time   :integer
#

class Package < ApplicationRecord
  REVISION_NUMBER = [1,2,3,4,5]
  PACK_LIST = ['Standard', 'Silver', 'Golden']

  belongs_to :service
  has_many :package_metrics
  has_many :order_items
  has_many :orders, through: :order_items
  has_many :buyers, through: :orders, source: :user
  has_many :buyer_reviews, through: :buyers
  has_many :cart_items

  validates :delivery_time, :revision_number, :description, :name, :price, presence: true
  validates :is_commercial, presence: true
  validates :price, numericality: { only_integer: true, greater_than: 1, less_than: 10000 }
  validates :revision_number,  inclusion: { in: Package::REVISION_NUMBER }


  def seller_reviews
    SellerReview.where(package: self)
  end

  def seller_review_star
    SellerReview.where(package: self).average(:star).round(1)
  end

  def buyer_review_star
    BuyerReview.where(package: self).average(:star).round(1)
  end

  def buyer_review_count
    BuyerReview.where(package: self).size
  end

  def buyer_reviews
    BuyerReview.where(package: self)
  end


end
