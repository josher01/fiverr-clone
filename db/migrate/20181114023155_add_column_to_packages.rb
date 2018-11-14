class AddColumnToPackages < ActiveRecord::Migration[5.2]
  def change
    add_column :packages, :is_commercial, :boolean
    add_column :packages, :revision_number, :integer
    add_column :packages, :delivery_time, :integer
  end
end
