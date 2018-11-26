class AddTypeToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :type, :string
    remove_column :reviews, :user_id, :integer
    add_column :reviews, :buyer_id, :integer
    add_column :reviews, :seller_id, :integer
  end
end
