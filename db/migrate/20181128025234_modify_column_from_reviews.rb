class ModifyColumnFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_reference :reviews, :service, index: true
    add_reference :reviews, :package, index: true
  end
end
