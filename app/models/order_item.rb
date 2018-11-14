class OrderItem < ApplicationRecord
  belongs_to :package
  belongs_to :order
end
