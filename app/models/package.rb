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
  belongs_to :service
  has_many :package_metrics
  has_many :order_items
  has_many :orders, through: :order_items
  has_many :buyers, through: :orders, source: :user
  has_many :buyer_reviews, through: :buyers
  has_many :cart_items
  REVISION_NUMBERS = [1,2,3,4,5]
  PACK_LIST = ['Standard', 'Silver', 'Golden']
  validates :price, numericality: { only_integer: true, greater_than: 1, less_than: 10000 }
  validates :revision_numbers,  inclusion: { in: Package::REVISION_NUMBERS }


  def seller_reviews
    SellerReview.where(package: self)
  end

  def seller_review_star
    SellerReview.where(package: self).average(:star)
  end

  def buyer_review_star
    BuyerReview.where(package: self).average(:star)
  end

  def buyer_review_count
    BuyerReview.where(package: self).size
  end

  def buyer_reviews
    BuyerReview.where(package: self)
  end


end
