# == Schema Information
#
# Table name: orders
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  shipping_status :string
#  payment_status  :integer
#  username        :string
#  address         :string
#  phone           :string
#  sn              :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
end
