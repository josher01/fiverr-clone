class RemoveAmountFromOrder < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :amount, :integer
  end
end
