class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :services
  has_many :favorites, dependent: :destroy
  has_many :reviews
  has_many :orders
  has_many :order_items, through: :orders


end
