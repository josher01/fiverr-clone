class User < ApplicationRecord
  
  LANGUAGE = [:en, :de, :es, :ru]
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :services, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_services, through: :favorites, source: :service
  has_many :reviews, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :order_items, through: :orders

  validates :name, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true

end

