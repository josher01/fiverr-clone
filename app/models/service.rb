class Service < ApplicationRecord
  belongs_to :category, counter_cache: true
  belongs_to :seller, class_name: "User", foreign_key: :user_id
  has_many :photos, dependent: :destroy
  has_many :packages, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user

  def standard_price
    self.packages.where("name = 'Standard'").first.price
  end

  def buyer_reviews
    BuyerReview.where(package: self.packages)
  end

  def seller_reviews
    SellerReview.where(package: self.packages)
  end

  def buyer_review_star
    self.buyer_reviews.average(:star)
  end

  def buyer_review_count
    self.buyer_reviews.size
  end

end
