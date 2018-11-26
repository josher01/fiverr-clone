class BuyerReview < Review
  belongs_to :buyer, class_name: "User"
end