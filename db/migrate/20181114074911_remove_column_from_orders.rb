class RemoveColumnFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :price, :integer
    remove_column :orders, :quantity, :integer
    remove_column :orders, :integer, :string
  end
end
