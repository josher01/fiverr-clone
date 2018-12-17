# == Schema Information
#
# Table name: services
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  category_id     :integer
#  title           :string
#  description     :text
#  favorites_count :integer          default(0)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Service < ApplicationRecord
  belongs_to :category, counter_cache: true
  belongs_to :seller, class_name: "User", foreign_key: :user_id
  has_many :photos, inverse_of: :service
  has_many :packages, inverse_of: :service
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  accepts_nested_attributes_for :packages, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :photos, reject_if: :all_blank, allow_destroy: true

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
