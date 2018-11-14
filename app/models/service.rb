class Service < ApplicationRecord
  belongs_to :seller, class_name: "User", foriegn_key: :user_id
  belongs_to :category, counter_cache: true
  has_many: :buyers, class_name: "User", foriegn_key: :user_id
  has_many :reviews, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :packages, dependent: :destroy
end
