class ModifyReferenceToSellerServices < ActiveRecord::Migration[5.2]
  def change
    remove_reference :services, :user, index: true
    add_reference :services, :seller, foreign_key: {to_table: :users}
  end
end
