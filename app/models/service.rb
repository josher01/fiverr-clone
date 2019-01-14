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
  has_many :photos 
  has_many :packages 
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  accepts_nested_attributes_for :packages, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :photos, reject_if: :all_blank, allow_destroy: true
  validates :title, :category_id, :description, presence: true
  validates :description, length: {minimum: 50, maximum: 1000}

  def self.search(keyword)
    where('description LIKE ? OR title LIKE ?', keyword, keyword).order(created_at: :desc)
  end


  def minimum_price
    self.packages.minimum(:price)
  end

  def buyer_reviews
    BuyerReview.where(package: self.packages)
  end

  def seller_reviews
    SellerReview.where(package: self.packages)
  end

  def buyer_review_star
    if self.buyer_reviews.average(:star).blank?
      return 0
    else
      self.buyer_reviews.average(:star).round(1)
    end
  end

  def buyer_review_count
    self.buyer_reviews.size
  end

  def is_favorited?(user)
    if user.favorited_services
      user.favorited_services.include?(self)
    else
      false
    end
  end
end
