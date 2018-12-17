# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  star       :integer
#  comment    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  type       :string
#  buyer_id   :integer
#  seller_id  :integer
#  package_id :integer
#

class SellerReview < Review
  belongs_to :seller, class_name: "User", foreign_key: :seller_id
end
