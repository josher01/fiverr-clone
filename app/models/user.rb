# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string
#  provider               :string
#  uid                    :integer
#  description            :text
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  avatar                 :string
#  language               :string
#  country                :string
#

class User < ApplicationRecord
  
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
  validates :description, length: {minimum: 150, maximum: 300}


  def buyer_review_star
    if self.services.present?
      if self.services.size == 0
        return 0
      else
        self.services.each do |service|
          if service.buyer_review_star.present?
            results = []
            results << service.buyer_review_star.to_i
            total = results.sum
            return total/results.length
          end
        end
      end
    else
      return 0
    end
  end
end

