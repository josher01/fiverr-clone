class Package < ApplicationRecord
  belongs_to :service
  has_many :package_metrics
  has_many :order_items
  has_many :orders, through: :order_items
  has_many :buyers, through: :orders, source: :user
  has_many :buyer_reviews, through: :buyers
  has_many :cart_items
  
  def seller_reviews
    SellerReview.where(package: self)
  end

  def seller_review_star
    BuyerReview.where(package: self).average(:star)
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
