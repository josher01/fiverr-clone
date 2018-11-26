class SellerReview < Review
  belongs_to :seller, class_name: "User"
end