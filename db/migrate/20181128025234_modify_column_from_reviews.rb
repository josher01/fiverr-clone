class ModifyColumnFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_reference :reviews, :service, references: :services, index: true
    add_reference :reviews, :package, references: :packages, index: true
  end
end
