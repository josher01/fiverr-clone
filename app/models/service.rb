class Service < ApplicationRecord
  belongs_to :user
  belongs_to :category, counter_cache: true
  has_many :reviews, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :packages, dependent: :destroy
end
